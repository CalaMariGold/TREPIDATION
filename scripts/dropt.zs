import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;
import mods.dropt.Dropt;

Dropt.list("no_soul_sand_drop")
  .add(Dropt.rule()
    .matchDrops([(<minecraft:soul_sand>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );

Dropt.list("no_brick_drop")
  .add(Dropt.rule()
    .matchDrops([<minecraft:red_nether_brick>.or(<minecraft:nether_brick>).or(<minecraft:nether_brick_stairs>).or(<minecraft:stone_slab:6>).or(<minecraft:nether_brick_fence>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );


Dropt.list("no_misc_block_drops")
  .add(Dropt.rule()
    .matchDrops([<quark:basalt>.or(<quark:biotite_block>).or(<quark:basalt:1>).or(<minecraft:black_glazed_terracotta>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );

Dropt.list("no_glow_stone")
  .add(Dropt.rule()
    .matchDrops([(<minecraft:glowstone_dust>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );