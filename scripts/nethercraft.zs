import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;
import mods.dropt.Dropt;
import mods.jei.JEI;

JEI.removeAndHide(<nethercraft:imp_helmet>);
JEI.removeAndHide(<nethercraft:imp_chestplate>);
JEI.removeAndHide(<nethercraft:imp_leggings>);
JEI.removeAndHide(<nethercraft:imp_boots>);

recipes.remove(<minecraft:magma_cream>);
recipes.addShapeless("magma_cream", <minecraft:magma_cream>,[<minecraft:blaze_powder>, <nethercraft:slime_eggs>]);

recipes.remove(<minecraft:fire_charge>);
recipes.addShapeless("fire_charge", <minecraft:fire_charge>*3,[<minecraft:blaze_powder>, <minecraft:gunpowder>]);

recipes.addShapeless("gunpowder", <minecraft:gunpowder>*5,[<minecraft:tnt>]);

furnace.addRecipe(<contenttweaker:scrambled_magma_eggs>, <nethercraft:slime_eggs>, 0.5);
recipes.addShapeless("deviled_egg_sandwich", <contenttweaker:deviled_egg_sandwich>,[<contenttweaker:scrambled_magma_eggs>, <nethercraft:devil_bread>, <minecraft:magma_cream>]);


var green_glowshroom = <nethercraft:green_glowshroom>;
var purple_glowshroom = <nethercraft:purple_glowshroom>;


// Glow Stew Recipe
recipes.addShapeless("glowstew", <nethercraft:glow_stew>,[green_glowshroom, purple_glowshroom, <ore:bowlWood>]);

recipes.remove(<minecraft:mushroom_stew>);
recipes.addShapeless("mushroom_stew_new", <minecraft:mushroom_stew>,[<ore:mushroomAny>,<ore:mushroomAny>, <ore:bowlWood>]);


// Slab
recipes.addShapedMirrored("glowood_slab", <minecraft:wooden_slab>*6,
[[<nethercraft:glowood_planks>,<nethercraft:glowood_planks>,<nethercraft:glowood_planks>],
[null,null,null],
[null,null,null]
]);

recipes.remove(<scalinghealth:healingitem:1>);
recipes.addShapeless("medkit", <scalinghealth:healingitem:1>, [<scalinghealth:healingitem>, <scalinghealth:healingitem>, <scalinghealth:healingitem>]);

recipes.remove(<scalinghealth:healingitem>);
recipes.addShaped("bandage", <scalinghealth:healingitem>,
[[null,null,null],
[<nethercraft:foulite_dust>,<nethercraft:foulite_dust>,<nethercraft:foulite_dust>],
[<ore:paper>,<ore:paper>,<ore:paper>]
]);


recipes.remove(<nethercraft:neridium_lighter>);
recipes.addShapeless("neridium lighter", <nethercraft:neridium_lighter>, [<nethercraft:neridium_ingot>, <nethercraft:foulite_dust>]);

// Remove Glowood Sapling Drop
Dropt.list("no_glowood_sapling")

  .add(Dropt.rule()
    .matchBlocks(["nethercraft:glowood_leaves:*"])
    .matchDrops([<nethercraft:glowood_sapling>])
    .replaceStrategy("REPLACE_ITEMS")
    .addDrop(Dropt.drop())
  );

// Ghast Bones Drop
Dropt.list("ghast_bones")

  .add(Dropt.rule()
      .matchBlocks(["minecraft:bone_block"])
      .addDrop(Dropt.drop()
          .items([<nethercraft:ghast_bones>])
          .selector(Dropt.weight(10))
      )
  );
<nethercraft:ghast_bones>.addTooltip("Sometimes drops from bone blocks");



val glowood_log as IItemStack = <nethercraft:glowood_log>;
glowood_log.hardness = 1;

// Arrow Recipes

recipes.remove(<minecraft:arrow>);

recipes.addShaped("newarrow", <minecraft:arrow>*8,
[[null,<ore:arrowIngredient>,null],
[null,<ore:stickWood>,null],
[null,<ore:feather>,null]
]);


