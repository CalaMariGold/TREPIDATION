#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;
import mods.dropt.Dropt;


recipes.addShapeless("heartcrystals", <scalinghealth:crystalshard>*8,[<scalinghealth:heartcontainer>]);


recipes.remove(<scalinghealth:heartdust>);
recipes.addShapeless("heartdust", <scalinghealth:heartdust>*2,[<scalinghealth:crystalshard>]);

// removed because they're stinky
recipes.remove(<scalinghealth:healingitem:1>);
recipes.remove(<scalinghealth:healingitem>);
