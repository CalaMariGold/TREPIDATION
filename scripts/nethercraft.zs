import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.dropt.Dropt;


var green_glowshroom = <nethercraft:green_glowshroom>;
var purple_glowshroom = <nethercraft:purple_glowshroom>;


// Glow Stew Recipe
recipes.addShapeless("glowstew", <nethercraft:glow_stew>,[green_glowshroom, purple_glowshroom, <ore:bowlWood>]);


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
