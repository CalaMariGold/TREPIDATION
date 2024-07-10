#loader crafttweaker reloadable
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
    .matchDrops([<quark:basalt>.or(<quark:biotite_block>).or(<quark:basalt:1>).or(<minecraft:black_glazed_terracotta>.or(<quark:biotite_slab>))])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );

Dropt.list("no_glow_stone")
  .add(Dropt.rule()
    .matchDrops([(<minecraft:glowstone_dust>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );

val horrorMod as IItemStack[] = [<horror_elements_mod:blood1>, <horror_elements_mod:blood_2>, <horror_elements_mod:blood_3>, <horror_elements_mod:blood_4>, <horror_elements_mod:blood_5>, <horror_elements_mod:blood_6>, <horror_elements_mod:blood_7>, <horror_elements_mod:blood_8>, <horror_elements_mod:blood_9>, <horror_elements_mod:blood_10>, <horror_elements_mod:acid_blood_1>, <horror_elements_mod:acid_blood_2>, <horror_elements_mod:green_blood_1>, <horror_elements_mod:green_blood_2>, <horror_elements_mod:colonial_marine_skull>, <horror_elements_mod:russian_officer_skull>, <horror_elements_mod:german_officer_skull>, <horror_elements_mod:hazzmat_skull>, <horror_elements_mod:villager_skull>, <horror_elements_mod:primitive_skull>, <horror_elements_mod:spiked_head>, <horror_elements_mod:impaled_skeleton>, <horror_elements_mod:deadcolonialmarine>, <horror_elements_mod:dead_hazmat>, <horror_elements_mod:dead_soldier>, <horror_elements_mod:dead_scientist>, <horror_elements_mod:rotten_cadaver>, <horror_elements_mod:beheaded_body>, <horror_elements_mod:sliced_body>, <horror_elements_mod:deadexperiment>, <horror_elements_mod:dead_cow>, <horror_elements_mod:dead_pig>, <horror_elements_mod:crucified_body>, <horror_elements_mod:spiked_body>, <horror_elements_mod:spiked_villager>, <horror_elements_mod:hanging_villager>, <horror_elements_mod:hanging_corpse_1>, <horror_elements_mod:hanging_body_2>, <horror_elements_mod:hospital_bed>, <horror_elements_mod:human_remains>, <horror_elements_mod:bloodygrave>, <horror_elements_mod:trapped_leg>, <horror_elements_mod:brokentv>, <horror_elements_mod:severed_hand>, <horror_elements_mod:sign_get_out>, <horror_elements_mod:sign_leave>, <horror_elements_mod:slashed_skull>];

for item in horrorMod{
  Dropt.list("remove horror drops")
    .add(Dropt.rule()
      .matchDrops([(item)])
      .replaceStrategy("REPLACE_ITEMS")
      .addDrop(Dropt.drop())
    );
}