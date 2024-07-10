#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;

JEI.removeAndHide(<quark:blaze_lantern>);
recipes.remove(<quark:holding_totem>);

recipes.remove(<quark:lit_lamp>);

recipes.remove(<quark:soul_powder>);
recipes.remove(<quark:soul_compass>);

// add back later maybe
recipes.remove(<quark:pickarang>);


recipes.addShaped("backpack", <quark:backpack>,
[[<nethercraft:lava_reeds_item>,<nethercraft:lava_reeds_item>,<nethercraft:lava_reeds_item>],
[<minecraft:string>,null,<nethercraft:ghast_bones>],
[<nethercraft:lava_reeds_item>,<nethercraft:lava_reeds_item>,<nethercraft:lava_reeds_item>]
]);