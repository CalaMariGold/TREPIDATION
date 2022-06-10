import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;


// Remove all recipes from simpleores
recipes.removeByMod("simpleores");
furnace.remove(<simpleores:copper_ingot>);
furnace.remove(<simpleores:tin_ingot>);
furnace.remove(<simpleores:mythril_ingot>);
furnace.remove(<simpleores:adamantium_ingot>);
furnace.remove(<simpleores:onyx_gem>);

recipes.addShaped("umber_sword", <simpleores:tin_sword>,
[[null,<erebus:umberstone:1>,null],
[null,<erebus:umberstone:1>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("umber_pickaxe", <simpleores:tin_pickaxe>,
[[<erebus:umberstone:1>,<erebus:umberstone:1>,<erebus:umberstone:1>],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShapedMirrored("umber_axe", <simpleores:tin_axe>,
[[<erebus:umberstone:1>,<erebus:umberstone:1>,null],
[<erebus:umberstone:1>,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("umber_shovel", <simpleores:tin_shovel>,
[[null,<erebus:umberstone:1>,null],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);


recipes.addShaped("copper_sword", <simpleores:copper_sword>,
[[null,<erebus:materials:43>,null],
[null,<erebus:materials:43>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_pickaxe", <simpleores:copper_pickaxe>,
[[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_axe", <simpleores:copper_axe>,
[[<erebus:materials:43>,<erebus:materials:43>,null],
[<erebus:materials:43>,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_shovel", <simpleores:copper_shovel>,
[[null,<erebus:materials:43>,null],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_helmet", <simpleores:copper_helmet>,
[[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>],
[null,null,null]
]);

recipes.addShaped("copper_chestplate", <simpleores:copper_chestplate>,
[[<erebus:materials:43>,null,<erebus:materials:43>],
[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>]
]);

recipes.addShaped("copper_leggings", <simpleores:copper_leggings>,
[[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>]
]);

recipes.addShaped("copper_boots", <simpleores:copper_boots>,
[[null,null,null],
[<erebus:materials:43>,null,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>]
]);
