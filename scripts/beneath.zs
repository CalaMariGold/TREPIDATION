#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;

// remove recipes/uses for Deep Stone (ContentTweaker doesnt work for beneath stone gen)
recipes.remove(<quark:elder_prismarine:2>);

val deep_stone as IItemStack = <quark:elder_prismarine:2>;
deep_stone.hardness = 0.2;