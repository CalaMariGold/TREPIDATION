#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Block;
import mods.contenttweaker.AxisAlignedBB;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;

val soul_anchor = mods.contenttweaker.VanillaFactory.createItem("soul_anchor");
soul_anchor.register();

val skull_and_bones = mods.contenttweaker.VanillaFactory.createItem("skull_and_bones");
skull_and_bones.register();

val trophy = mods.contenttweaker.VanillaFactory.createItem("trophy");
trophy.register();

val trepidation = mods.contenttweaker.VanillaFactory.createItem("trepidation");
trepidation.register();