#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;
import mods.dropt.Dropt;

JEI.removeAndHide(<minecraft:ender_eye>);
LootTable.removeGlobalItem("minecraft:ender_eye");

// will be reworked later
recipes.remove(<minecraft:bow>);

recipes.remove(<minecraft:book>);
recipes.remove(<minecraft:lead>);
recipes.remove(<minecraft:tnt>);
JEI.removeAndHide(<minecraft:map>);
JEI.removeAndHide(<minecraft:end_crystal>);
JEI.removeAndHide(<minecraft:end_rod>);
JEI.removeAndHide(<minecraft:potion:*>);
JEI.removeAndHide(<minecraft:brewing_stand>);
JEI.removeAndHide(<minecraft:magma>);
JEI.removeAndHide(<minecraft:writable_book>);
JEI.removeAndHide(<minecraft:quartz_block:*>);
JEI.removeAndHide(<minecraft:quartz_stairs>);
JEI.removeAndHide(<minecraft:stone_slab:7>); // quartz slab


JEI.removeAndHide(<minecraft:iron_pickaxe>);
JEI.removeAndHide(<minecraft:wooden_pickaxe>);
JEI.removeAndHide(<minecraft:stone_pickaxe>);
JEI.removeAndHide(<minecraft:golden_pickaxe>);



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

//remove miscellaneous quartz crafting recipes
recipes.removeByRecipeName("minecraft:granite");
recipes.removeByRecipeName("minecraft:diorite");
recipes.removeByRecipeName("minecraft:daylight_detector");
recipes.removeByRecipeName("quark:stone");

//remove all bed recipes
for i in 0 to 16{
  JEI.removeAndHide(<minecraft:bed>.definition.makeStack(i));
}

JEI.removeAndHide(<minecraft:fishing_rod>);
recipes.removeByRecipeName("minecraft:carrot_on_a_stick");

Dropt.list("no_dimension_barrier")

  .add(Dropt.rule()
    .matchDrops([<dimstack:bedrock:0>.or(<dimstack:bedrock:1>).or(<dimstack:bedrock:2>).or(<dimstack:bedrock:3>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );
