import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;
import mods.dropt.Dropt;


Dropt.list("no_mushrooms_in_nether")
  .add(Dropt.rule()
    .matchDrops([<minecraft:red_mushroom>.or(<minecraft:brown_mushroom>)])
    .matchHarvester(Dropt.harvester()
        .gameStages("WHITELIST", "ALL", ["nether"])
      )
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );
