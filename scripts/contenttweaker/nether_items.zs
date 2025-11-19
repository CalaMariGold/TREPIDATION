#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Block;
import mods.contenttweaker.AxisAlignedBB;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;

var scrambled_magma_eggs = VanillaFactory.createItemFood("scrambled_magma_eggs", 8);
scrambled_magma_eggs.setSaturation(0.4);
scrambled_magma_eggs.register();

var deviled_egg_sandwich = VanillaFactory.createItemFood("deviled_egg_sandwich", 12);
deviled_egg_sandwich.setSaturation(0.6);
deviled_egg_sandwich.register();

var glow_stew = VanillaFactory.createItemFood("glow_stew", 8);
glow_stew.setSaturation(0.4);
glow_stew.register();

var sanity_stew = VanillaFactory.createItemFood("sanity_stew", 8);
sanity_stew.setSaturation(0.5);
sanity_stew.register();


val infernal_fortress_scepter = mods.contenttweaker.VanillaFactory.createItem("infernal_fortress_scepter");
infernal_fortress_scepter.maxStackSize = 1;
infernal_fortress_scepter.register();

val riftbreaker_crystal = mods.contenttweaker.VanillaFactory.createItem("riftbreaker_crystal");
riftbreaker_crystal.maxStackSize = 1;
riftbreaker_crystal.register();

val wither_infernium = mods.contenttweaker.VanillaFactory.createItem("wither_infernium");
wither_infernium.register();

val vitality_orb = mods.contenttweaker.VanillaFactory.createItem("vitality_orb");
vitality_orb.register();

val dreadstone_fragment = mods.contenttweaker.VanillaFactory.createItem("dreadstone_fragment");
dreadstone_fragment.register();
dreadstone_fragment.maxStackSize = 256;

val infernal_core = mods.contenttweaker.VanillaFactory.createItem("infernal_core");
infernal_core.register();

val raw_unstable_infernium = mods.contenttweaker.VanillaFactory.createItem("raw_unstable_infernium");
raw_unstable_infernium.register();
raw_unstable_infernium.maxStackSize = 256;

val unstable_sand = mods.contenttweaker.VanillaFactory.createItem("unstable_sand");
unstable_sand.register();
unstable_sand.maxStackSize = 256;