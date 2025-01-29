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


// dropped from Ashen Oracle
recipes.remove(<quark:backpack>);


recipes.remove(<quark:arrow_explosive>);
recipes.addShapeless("explosive_arrow", <quark:arrow_explosive>,[<minecraft:arrow>, <minecraft:fire_charge>]);
