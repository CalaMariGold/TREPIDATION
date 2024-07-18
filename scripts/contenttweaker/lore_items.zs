#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Block;
import mods.contenttweaker.AxisAlignedBB;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;

val dreadswine_entry = mods.contenttweaker.VanillaFactory.createItem("dreadswine_entry");
dreadswine_entry.register();

val foulite_dust_entry = mods.contenttweaker.VanillaFactory.createItem("foulite_dust_entry");
foulite_dust_entry.register();