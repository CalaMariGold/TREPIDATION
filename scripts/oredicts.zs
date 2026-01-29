#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;


val cobbleOreDict = <ore:cobblestone>;
cobbleOreDict.remove(<erebus:umberstone:1>);


val logOreDict = <ore:logWood>;
logOreDict.add(<nethercraft:glowood_log>);

val stickOreDict = <ore:stickWood>;
stickOreDict.add(<nethercraft:glowood_stick>);

val bowlOreDict = <ore:bowlWood>;
bowlOreDict.add(<nethercraft:glowood_bowl>);
bowlOreDict.add(<minecraft:bowl>);

val treeLeavesOreDict = <ore:treeLeaves>;
treeLeavesOreDict.add(<nethercraft:glowood_leaves>);

val coalOreDict = <ore:coal>;
coalOreDict.add(<nethercraft:foulite_dust>);
coalOreDict.add(<minecraft:coal>);
coalOreDict.add(<minecraft:coal:1>);

// not used atm
// val paperOreDict = <ore:paper>;
// paperOreDict.add(<nethercraft:lava_paper>);

val arrow_ingredientOreDict = <ore:arrowIngredient>;
arrow_ingredientOreDict.add(<minecraft:flint>, <minecraft:quartz>, <erebus:materials:2>);

val featherOreDict = <ore:feather>;
featherOreDict.add(<nethercraft:red_feather>, <erebus:materials:6>);
