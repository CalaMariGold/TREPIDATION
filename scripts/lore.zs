import crafttweaker.game.IGame;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Food
<contenttweaker:scrambled_magma_eggs>.displayName = "Scrambled Magma Eggs";
<contenttweaker:scrambled_magma_eggs>.addTooltip("§3Gives Fire Resistance for 10s");

<contenttweaker:deviled_egg_sandwich>.displayName = "§cDeviled Egg Sandwich";
<contenttweaker:deviled_egg_sandwich>.addTooltip("§3Gives Fire Resistance and Strength for 30s");

<nethercraft:slime_eggs>.displayName = "Magma Eggs";
<nethercraft:slime_eggs>.addTooltip("§oCan be hurled at foes to ignite them or harnessed to create a deceptively fiery meal.");
<nethercraft:devil_bread>.addTooltip("§oA smoldering delicacy pairing exquisitely with the deliciousness of Magma Eggs");
<nethercraft:devil_bread>.addTooltip("§3Gives Strength for 10s");
<nethercraft:glow_apple>.displayName = "Glow Worm";


// Skills
<enderskills:token>.displayName = "§cTrace of Death";
<enderskills:token>.addTooltip("§3Right-click to break and add to your Souls");

JEI.addDescription(<enderskills:token>,"Veiled in cryptic lore, the Trace of Death stands as an enigmatic artifact of potent might. Its origin remains an enigma, whispered in hushed tones and often lost within the labyrinth of fear-stricken narratives. Its eerie presence is marked by a cold, ominous aura that seems to permeate the air around it.
When shattered, the Trace of Death unleashes a torrent of spectral energies that emanate from the broken fragments, reaching out to ensnare the wandering souls that still cling to this realm. These souls are then drawn inexorably towards the one who shattered the artifact, granting them not only an infusion of raw power but also a glimpse into the secrets and knowledge that these spirits once held.
However, such power comes at a steep cost, for the Trace of Death is rumored to be cursed, and its influence can drive even the most level-headed adventurer to madness and despair. Its effects are said to linger long after the artifact is destroyed, tainting the very essence of those who wield it and beckoning forth the attentions of entities that thrive in the shadows.
Few dare to seek out the Trace of Death, for its power is as volatile as it is mysterious, and those who venture into the unknown are often consumed by the very darkness that they sought to master. Yet, for the brave and the bold, the Trace of Death represents a unique opportunity to tap into the forbidden knowledge and power that this world has to offer, no matter the cost.");

<enderskills:book>.displayName = "§cGrimoire of the Veil";
<enderskills:book>.addTooltip("§3Press R on this item to learn about skills");
<enderskills:book>.addTooltip("§3Does not drop on death");
JEI.addDescription(<enderskills:book>,"There are 3 main classes you can delve into and combine: Defense, Mobility, and Offense with multiple subclasses for each. Press SHIFT + [number] to use an ability and G and H to cycle through class ability sets. Unlocking skills cost XP and Souls. You can obtain Souls by breaking Traces of Death. Soul prices increase as you spend and you can only have a max of 9 Souls, meaning that you can't unlock everything, so spend wisely. You can always reset to try a new build!");

// Nether
JEI.addDescription(<nethercraft:foulite_dust>,"Foulite Dust, a greenish luminescent substance found throughout The Nether, is believed to originate from the fusion of foul energies and remnants of organic matter. Despite its ominous origins, this highly flammable and volatile dust serves as a valuable resource for illumination, smelting, and oddly enough helps repair wounds. A symbol of hope and ingenuity, Foulite Dust demonstrates the resilience of the human spirit, even when faced with the horrors that pervade The Nether.");

// Infernium
<nethercraft:pyridium_ore>.displayName = "Infernium Ore";
<nethercraft:pyridium_block>.displayName = "Infernium Block";
<nethercraft:pyridium_ingot>.displayName = "Infernium Ingot";
JEI.addDescription(<nethercraft:pyridium_ingot>,"Infernium is a rare and powerful ore found exclusively within the The Nether. Born from the ashes of ancient infernal beings that once ruled this realm with their unyielding power of fire and destruction, Infernium is the embodiment of their eternal wrath and fury. This yellow-hued ore glows with an inner light, as if the very souls of those ancient entities still smolder within its core. Harnessing the destructive essence of Infernium requires great courage and skill. When fused with blaze rods, Infernium can create an item capable of summoning the Infernal Fortress. Weapons and artifacts imbued with Infernium are said to possess the strength and intensity of the ancient infernal beings themselves, capable of channeling their fiery powers and unleashing devastating attacks upon their foes.");

<nethercraft:pyridium_sword>.displayName = "Infernium Sword";

<contenttweaker:wither_infernium>.displayName = "§cWithering Infernium Ingot";
<nethercraft:pyridium_pickaxe>.displayName = "§cWithering Infernium Pickaxe";
<nethercraft:pyridium_pickaxe>.addTooltip("§oA tool imbued with the power to wither away an otherwise impervious barrier, a coveted possession of a fearsome adversary.");

<nethercraft:pyridium_axe>.displayName = "Infernium Axe";
<nethercraft:pyridium_shovel>.displayName = "Infernium Shovel";
<nethercraft:pyridium_bow>.displayName = "Infernium Bow";

// Veilstrium
<nethercraft:neridium_ore>.displayName = "Veilstrium Ore";
<nethercraft:neridium_block>.displayName = "Veilstrium Block";
<nethercraft:neridium_ingot>.displayName = "Veilstrium Ingot";
JEI.addDescription(<nethercraft:neridium_ingot>,"Veilstrium is a rare and mystical ore that can only be found within the treacherous depths of The Nether. Born from the amalgamation of ethereal energies and the elemental forces of the underworld, it is said to have formed when the essence of countless lost souls seeped into the very fabric of the realm, eventually coalescing and crystallizing into this unique purplish mineral. Veilstrium's origin grants it a supernatural resilience, making it a highly sought-after material for crafting weapons and armor. Its unique properties allow it to absorb and dissipate the malevolent energies that pervade The Nether, bestowing its wielders with an otherworldly endurance. Legends whisper that those who possess items crafted from Veilstrium are not only protected from the dangers of The Nether but may also find themselves attuned to the whispers of the long-forgotten souls trapped within the ore. Such spectral guidance can grant travelers valuable insights and instincts, allowing them to navigate the treacherous realms with greater ease.");


<nethercraft:neridium_sword>.displayName = "Veilstrium Sword";
<nethercraft:neridium_pickaxe>.displayName = "Veilstrium Pickaxe";
<nethercraft:neridium_axe>.displayName = "Veilstrium Axe";
<nethercraft:neridium_shovel>.displayName = "Veilstrium Shovel";
<nethercraft:neridium_bucket>.displayName = "Veilstrium Bucket";
<nethercraft:neridium_helmet>.displayName = "Veilstrium Helmet";
<nethercraft:neridium_chestplate>.displayName = "Veilstrium Chestplate";
<nethercraft:neridium_leggings>.displayName = "Veilstrium Leggings";
<nethercraft:neridium_boots>.displayName = "Veilstrium Boots";

<contenttweaker:riftbreaker_crystal>.displayName = "§cRiftbreaker Crystal";
<contenttweaker:riftbreaker_crystal>.addTooltip("§oAn explosive gem that obliterates everything in its vertical path and catapults all allies skyward.");

<contenttweaker:infernal_fortress_scepter>.displayName = "§cScepter of Infernal Conjuring";
<contenttweaker:infernal_fortress_scepter>.addTooltip("§oA formidable artifact that holds the power to beckon forth a gargantuan fortress shrouded in whispers of an ancient and fearsome presence.");
JEI.addDescription(<contenttweaker:infernal_fortress_scepter>,"In shadows' embrace, a fortress concealed,
A realm of whispers and secrets, unyielded,
Tales of dread and despair, unrevealed,
A citadel forlorn, to mortal eyes sealed.
Through veiled pathways, where darkness abounds,
Echoes of anguish, the air resounds,
The scent of sulfur, infernal surrounds,
A dominion of torment, where hope is impounded.");

JEI.addDescription(<nethercraft:ghast_bones>,"Ghasts are enigmatic and terrifying creatures that dwell within the depths of The Nether. With their ghostly white skin, tentacle-like appendages, and piercing wails, they have become one of the most iconic symbols of this cursed realm.
Ghasts play a crucial role in the creation of Veilstrium tools. Their bones possess a unique resonance that enables them to interact with the otherworldly properties of Veilstrium.
Some even claim that the bones of Ghasts hold a deeper significance, serving as a conduit between the physical realm and the ethereal plane that underlies some aspects of The Nether.");

JEI.addDescription(<minecraft:blaze_rod>,"Blaze rods, obtained only by slaying the fearsome Blazes and their mightier kin, the Blazing Juggernauts, serve as a potent source of fuel and illumination. When combined with the fiery essence of Infernium, they can be forged into powerful artifacts and weapons that harness intense heat and destructive energy.");

JEI.addDescription(<nethercraft:glowood_log>,"Glowood Trees are the eerie flora that dot the burning landscape of The Nether. These ominous trees are composed of a unique blend of Glowstone and Basalt, imbuing them with both the eerie luminescence of the former and the explosive resistance of the latter. They are home to the elusive Gloworms, small creatures that dwell within the leaves of the trees. These bioluminescent insects are prized for their glow and their nourishment, leaving them to be very useful for those seeking to survive in The Nether.");
JEI.addDescription(<nethercraft:glow_apple>,"Glowood Trees are the eerie flora that dot the burning landscape of The Nether. These ominous trees are composed of a unique blend of Glowstone and Basalt, imbuing them with both the eerie luminescence of the former and the explosive resistance of the latter. They are home to the elusive Gloworms, small creatures that dwell within the leaves of the trees. These bioluminescent insects are prized for their glow and their nourishment, leaving them to be very useful for those seeking to survive in The Nether.");

<simpleores:tin_pickaxe>.displayName = "Quartz Pickaxe";
<simpleores:tin_pickaxe>.addTooltip("§3Bone blocks will always drop 2 ghast bones when mined");
<nethercraft:neridium_bow>.displayName = "Quartz Bow";

<nethercraft:neridium_lighter>.displayName = "Quartz Lighter";
<nethercraft:ghast_bomb>.addTooltip("§oA volatile and spectral explosive, awaiting ignition by a Quartz Lighter to unleash its devastating force.");
<nethercraft:ghast_marrow>.addTooltip("§oAn unstable substance, harboring explosive potential.");

<mysticstaffs:fire_staff>.displayName = "§cStaff of Infernal";
<mysticstaffs:fire_staff>.addTooltip("§oA potent weapon that engulfs nearby enemies in a searing inferno.");
<contenttweaker:vitality_orb>.displayName = "Orb of Veilheart";
JEI.addDescription(<contenttweaker:vitality_orb>,"The Orb of Veilheart, a miraculous fusion of ethereal Veilstrium and enigmatic Foulite dust, possesses a unique duality that unlocks its potent soul-healing powers. The Veilstrium's celestial energies cleanse and purify the spirit, while the Foulite dust's grounding properties restore balance and stability to the physical realm, harmoniously mending both body and soul.");

<mysticstaffs:heal_staff>.displayName = "§cStaff of Veilheart";
<mysticstaffs:heal_staff>.addTooltip("§oA benevolent staff that rejuvenates the soul and body of allies.");
<mysticstaffs:heal_staff>.addTooltip("§3Uses 1 feather");

<nethercraft:ghast_bones>.addTooltip("§oOccasionally harvested from bone blocks submerged in the searing lava oceans.");


// Deep Dark
<quark:elder_prismarine:2>.displayName = "Deep Stone";

// Misc
<quark:soul_compass>.addTooltip("§oA guiding relic, directing you unerringly to the site of your most recent demise");
<minecraft:fire_charge>.addTooltip("§oA blazing projectile, detonating with fiery force upon impact.");
<scalinghealth:healingitem:0>.addTooltip("§oEssential and versatile, these bandages provide healing and can be combined to form a medkit for enhanced recovery.");
<scalinghealth:heartcontainer>.removeTooltip("Increases maximum health");
<scalinghealth:heartcontainer>.addTooltip("§oA precious relic of vitality, bestowing its user with a permanently increased life force.");
<minecraft:torch>.addTooltip("§3Does not drop on death");


