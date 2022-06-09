import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;

JEI.removeAndHide(<quark:blaze_lantern>);
recipes.remove(<quark:holding_totem>);

recipes.remove(<quark:soul_powder>);
recipes.addShapeless("soul_powder", <quark:soul_powder>*4,[<minecraft:soul_sand>,<minecraft:soul_sand>,<minecraft:soul_sand>,<quark:soul_bead>]);

recipes.remove(<quark:soul_compass>);
recipes.addShapedMirrored("soul_compass", <quark:soul_compass>,
[[null,<quark:soul_powder>,null],
[<quark:soul_powder>,<nethercraft:neridium_ingot>,<quark:soul_powder>],
[null,<quark:soul_powder>,null]
]);