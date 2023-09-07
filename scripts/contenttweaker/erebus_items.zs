#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Block;
import mods.contenttweaker.AxisAlignedBB;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;

var bug_meat = VanillaFactory.createItemFood("bug_meat", 1);
bug_meat.setSaturation(0.1);
bug_meat.register();

var cooked_bug_meat = VanillaFactory.createItemFood("cooked_bug_meat", 4);
cooked_bug_meat.setSaturation(0.3);
cooked_bug_meat.register();