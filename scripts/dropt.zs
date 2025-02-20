#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;
import mods.dropt.Dropt;
import mods.dropt.Harvester;



Dropt.list("fiery_lit1")
  .add(Dropt.rule()
        .matchBlocks(["da:fire_stone_lit:*"])
        .matchHarvester(Dropt.harvester()
            .type("PLAYER")
            .mainHand([
                <nethercraft:glowood_pickaxe:*>,
                <nethercraft:netherrack_pickaxe:*>,
                <simpleores:tin_pickaxe:*>,
                <nethercraft:neridium_pickaxe:*>,
                <nethercraft:pyridium_pickaxe:*>
            ])
        )
        .addDrop(Dropt.drop())
);


Dropt.list("sanity_journal_entry")
  .add(Dropt.rule()
      .matchBlocks(["quark:elder_prismarine:2"])
      .matchHarvester(Dropt.harvester()
        .gameStages("BLACKLIST", "ALL", ["sanity_journal_entry"])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(99))
          .items([<quark:elder_prismarine:2>])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(1))
          .items([<contenttweaker:sanity_entry>,<quark:elder_prismarine:2>])
      )
  );


Dropt.list("foulite_dust_journal_entry")
  .add(Dropt.rule()
      .matchBlocks(["nethercraft:foulite_ore:*"])
      .matchHarvester(Dropt.harvester()
        .gameStages("BLACKLIST", "ALL", ["foulite_dust_entry"])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(90))
          .items([<nethercraft:foulite_dust>])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(10))
          .items([<contenttweaker:foulite_dust_entry>,<nethercraft:foulite_dust>])
      )
  );

Dropt.list("veilstrium_journal_entry")
  .add(Dropt.rule()
      .matchBlocks(["nethercraft:neridium_ore:*"])
      .matchHarvester(Dropt.harvester()
        .gameStages("BLACKLIST", "ALL", ["veilstrium_entry"])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(85))
          .items([<dynaores:raw_neridium>])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(15))
          .items([<contenttweaker:veilstrium_entry>,<dynaores:raw_neridium>])
      )
);

Dropt.list("raw_unstable_infernium")
  .add(Dropt.rule()
      .matchBlocks(["nethercraft:pyridium_ore:*"])
      .replaceStrategy("REPLACE_ALL")
      .addDrop(Dropt.drop()
          .items([<contenttweaker:raw_unstable_infernium>])
      )
);

Dropt.list("infernium_journal_entry")
  .add(Dropt.rule()
      .matchBlocks(["nethercraft:pyridium_ore:*"])
      .matchHarvester(Dropt.harvester()
        .gameStages("BLACKLIST", "ALL", ["infernium_entry"])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(70))
          .items([<contenttweaker:raw_unstable_infernium>])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(30))
          .items([<contenttweaker:infernium_entry>,<contenttweaker:raw_unstable_infernium>])
      )
);

Dropt.list("glowood_journal_entry")
  .add(Dropt.rule()
      .matchBlocks(["nethercraft:glowood_log:*"])
      .matchHarvester(Dropt.harvester()
        .gameStages("BLACKLIST", "ALL", ["glowood_entry"])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(90))
          .items([<nethercraft:glowood_log>])
      )
      .addDrop(Dropt.drop()
          .selector(Dropt.weight(10))
          .items([<contenttweaker:glowood_entry>,<nethercraft:glowood_log>])
      )
);




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
    .matchDrops([<minecraft:magma>.or(<quark:basalt>).or(<quark:biotite_block>).or(<quark:basalt:1>).or(<minecraft:black_glazed_terracotta>).or(<quark:biotite_slab>)])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );

Dropt.list("no_dungeon_boss_drops")
  .add(Dropt.rule()
    .matchDrops([<minecraft:gold_block>.or(<da:fire_stone_stairs>).or(<minecraft:iron_bars>).or(<da:fire_stone_wall>).or(<da:fire_stone_half>).or(<da:change_block>).or(<da:fire_stone>).or(<da:fire_stone_lit>)])
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