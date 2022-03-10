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

recipes.addShaped("newarrow", <minecraft:arrow>*8,
[[null,<ore:arrowIngredient>,null],
[null,<ore:stickWood>,null],
[null,<ore:feather>,null]
]);


