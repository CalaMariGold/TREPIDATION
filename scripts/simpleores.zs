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

val quartzPickaxeEnchantments as IEnchantmentDefinition[] = [<enchantment:minecraft:efficiency>];
var quartzPickaxeEnchantmentMap as IData = {};

quartzPickaxeEnchantmentMap += quartzPickaxeEnchantments[0].makeEnchantment(2).makeTag();

recipes.addShaped("quartz_pickaxe", <simpleores:tin_pickaxe>.withTag(({"Quark:RuneColor": 14, "Quark:RuneAttached": 1 as byte} as IData) + quartzPickaxeEnchantmentMap),
[[<minecraft:quartz>,<minecraft:quartz>,<minecraft:quartz>],
[<nethercraft:lava_reeds_item>,<nethercraft:glowood_stick>,<nethercraft:lava_reeds_item>],
[null,<nethercraft:glowood_stick>,null]
]);

