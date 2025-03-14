// The MIT License
// Copyright © 2024 Benjamin Stott "sixthsurge"
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#if !defined INCLUDE_UTILITY_COLOR
#define INCLUDE_UTILITY_COLOR

const vec3 luminanceWeightsRec709  = vec3(0.2126, 0.7152, 0.0722);
const vec3 luminanceWeightsRec2020 = vec3(0.2627, 0.6780, 0.0593);
const vec3 luminanceWeightsAp1     = vec3(0.2722, 0.6741, 0.0537);
#define luminance_weights luminance_weights_rec2020

const vec3 primaryWavelengthsRec709  = vec3(660.0, 550.0, 440.0);
const vec3 primaryWavelengthsRec2020 = vec3(660.0, 550.0, 440.0);
const vec3 primaryWavelengthsAp1     = vec3(630.0, 530.0, 465.0);
#define primary_wavelengths primary_wavelengths_rec2020

// -----------------------------------
//   Color space conversion matrices
// -----------------------------------

#define display_to_working_color rec709_to_rec2020
#define working_to_display_color rec2020_to_rec709
#define rec709_to_working_color  rec709_to_rec2020

// Helper macro to convert sRGB colors to working space
#define from_srgb(x) (pow(x, vec3(2.2)) * rec709_to_rec2020)

// Rec. 709 (sRGB primaries)
const mat3 xyzToRec709 = mat3(
	 3.2406, -1.5372, -0.4986,
	-0.9689,  1.8758,  0.0415,
	 0.0557, -0.2040,  1.0570
);
const mat3 rec709ToXyz = mat3(
	 0.4124,  0.3576,  0.1805,
	 0.2126,  0.7152,  0.0722,
	 0.0193,  0.1192,  0.9505
);

// Rec. 2020 (working color space)
const mat3 xyzToRec2020 = mat3(
	 1.7166084, -0.3556621, -0.2533601,
	-0.6666829,  1.6164776,  0.0157685,
	 0.0176422, -0.0427763,  0.94222867
);
const mat3 rec2020ToXyz = mat3(
	 0.6369736, 0.1446172, 0.1688585,
	 0.2627066, 0.6779996, 0.0592938,
	 0.0000000, 0.0280728, 1.0608437
);

const mat3 rec709ToRec2020 = rec709ToXyz * xyzToRec2020;
const mat3 rec2020ToRec709 = rec2020ToXyz * xyzToRec709;

// ------------------------------
//   Transfer functions (gamma)
// ------------------------------

#define display_eotf srgb_eotf
#define display_eotf_inv srgb_eotf_inv

vec3 srgbEotf(vec3 linear) { // linear -> sRGB
	return 1.14374 * (-0.126893 * linear + sqrt(linear)); // from Jodie in #snippets
}
vec3 srgbEotfInv(vec3 srgb) { // sRGB -> linear
	return srgb * (srgb * (srgb * 0.305306011 + 0.682171111) + 0.012522878); // https://chilliant.blogspot.com/2012/08/srgb-approximations-for-hlsl.html
}

// ---------------------------------------------------------------
//   Transformations between RGB and other color representations
// ---------------------------------------------------------------

// from https://gist.github.com/983/e170a24ae8eba2cd174f
vec3 rgbToHsl(vec3 c) {
	const vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);

	vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
	vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

	float d = q.x - min(q.w, q.y);
	float e = 1e-6;

	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hslToRgb(vec3 c) {
	const vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);

	c.yz = clamp01(c.yz);

	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);

	return c.z * mix(K.xxx, clamp01(p - K.xxx), c.y);
}

// from https://en.wikipedia.org/wiki/YCoCg#Conversion_with_the_RGB_color_model
vec3 rgbToYcocg(vec3 rgb) {
	const mat3 cm = mat3(
		 0.25,  0.5,   0.25,
		 0.5,   0.0,  -0.5,
		-0.25,  0.5,  -0.25
	);
	return rgb * cm;
}
vec3 ycocgToRgb(vec3 ycocg) {
	float tmp = ycocg.x - ycocg.z;
	return vec3(tmp + ycocg.y, ycocg.x + ycocg.z, tmp - ycocg.y);
}

// Original source: https://github.com/Jessie-LC/open-source-utility-code/blob/main/advanced/blackbody.glsl
vec3 blackbody(float temperature) {
	const vec3 lambda  = primaryWavelengthsAp1;
	const vec3 lambda2 = lambda * lambda;
	const vec3 lambda5 = lambda2 * lambda2 * lambda;

	const float h = 6.63e-16; // Planck constant
	const float k = 1.38e-5;  // Boltzmann constant
	const float c = 3.0e17;   // Speed of light

	const vec3 a = lambda5 / (2.0 * h * c * c);
	const vec3 b = (h * c) / (k * lambda);
	vec3 d = exp(b / temperature);

	vec3 rgb = a * d - a;
	return minOf(rgb) / rgb;
}

// Isolate a range of hues
float isolateHue(vec3 hsl, float center, float width) {
	if (hsl.y < 1e-2 || hsl.z < 1e-2) return 0.0; // black/gray colors with no hue
	return pulse(hsl.x * 360.0, center, width, 360.0);
}

#endif // INCLUDE_UTILITY_COLOR
