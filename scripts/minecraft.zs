import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;

JEI.removeAndHide(<minecraft:ender_eye>);
LootTable.removeGlobalItem("minecraft:ender_eye");

val stone as IItemStack = <minecraft:stone:*>;
stone.hardness = 5.5;

val cobble as IItemStack = <minecraft:cobblestone:*>;
cobble.hardness = 5.5;

val mossy_cobblestone as IItemStack = <minecraft:mossy_cobblestone:*>;
mossy_cobblestone.hardness = 5.5;

val stained_hardened_clay as IItemStack = <minecraft:stained_hardened_clay:*>;
stained_hardened_clay.hardness = 5.5;

val biome_cobblestone as IItemStack = <quark:biome_cobblestone:*>;
biome_cobblestone.hardness = 5.5;

val slate as IItemStack = <quark:slate:*>;
slate.hardness = 5.5;

val redstoneAdjacent as IItemStack[] = [<minecraft:redstone>, <minecraft:redstone_block>, <minecraft:redstone_torch>, <minecraft:repeater>, <minecraft:comparator>, <minecraft:redstone_lamp>, <minecraft:activator_rail>, <minecraft:piston>, <minecraft:sticky_piston>, <minecraft:observer>, <minecraft:golden_rail>, <minecraft:detector_rail>, <minecraft:dropper>, <minecraft:dispenser>, <minecraft:clock>, <minecraft:compass>, <minecraft:noteblock>];

for item in redstoneAdjacent{
    recipes.remove(item);
}
JEI.removeAndHide(<minecraft:fishing_rod>);
recipes.remove(<minecraft:carrot_on_a_stick>);