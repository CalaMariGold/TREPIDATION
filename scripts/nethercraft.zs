import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;
import mods.dropt.Dropt;
import mods.jei.JEI;

JEI.removeAndHide(<nethercraft:imp_helmet>);
JEI.removeAndHide(<nethercraft:imp_chestplate>);
JEI.removeAndHide(<nethercraft:imp_leggings>);
JEI.removeAndHide(<nethercraft:imp_boots>);

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




// Ghast Bones Drop
Dropt.list("ghast_bones")

  .add(Dropt.rule()
      .matchBlocks(["minecraft:bone_block"])
      .addDrop(Dropt.drop()
          .items([<nethercraft:ghast_bones>])
          .selector(Dropt.weight(50))
      )
  );
<nethercraft:ghast_bones>.addTooltip("Sometimes drops from bone blocks");



val glowood_log as IItemStack = <nethercraft:glowood_log>;
glowood_log.hardness = 1;

// Arrow Recipes

recipes.remove(<minecraft:arrow>);

recipes.addShaped("newarrow", <minecraft:arrow>*4,
[[null,<ore:arrowIngredient>,null],
[null,<ore:stickWood>,null],
[null,<ore:feather>,null]
]);


