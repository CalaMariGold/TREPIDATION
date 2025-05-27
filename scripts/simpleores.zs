#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;

// Remove all recipes from simpleores
recipes.removeByMod("simpleores");
furnace.remove(<simpleores:copper_ingot>);
furnace.remove(<simpleores:tin_ingot>);
furnace.remove(<simpleores:mythril_ingot>);
furnace.remove(<simpleores:adamantium_ingot>);
furnace.remove(<simpleores:onyx_gem>);


// Recipe creation for Quartz Pickaxe (simpleores:tin_pickaxe) in GroovyScript for Baked Enchants support
