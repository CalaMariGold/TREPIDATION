#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;

JEI.hideCategory("minecraft.anvil");
JEI.hideCategory("minecraft.brewing");


//removing all hoes by searching for item id's
var hoesAll = itemUtils.getItemsByRegexRegistryName(":*_hoe$") as IItemStack[];
for hoe in hoesAll{
    JEI.removeAndHide(hoe);
}