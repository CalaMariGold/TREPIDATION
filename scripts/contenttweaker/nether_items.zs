#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Block;
import mods.contenttweaker.AxisAlignedBB;

var scrambled_slime_eggs = VanillaFactory.createItemFood("scrambled_slime_eggs", 8);
scrambled_slime_eggs.setSaturation(0.4);
scrambled_slime_eggs.register();

var deviled_egg_sandwish = VanillaFactory.createItemFood("deviled_egg_sandwish", 12);
deviled_egg_sandwish.setSaturation(0.6);
deviled_egg_sandwish.register();