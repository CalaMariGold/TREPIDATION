import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;


// Remove all recipes from atop
recipes.removeByMod("atop");


recipes.addShaped("umber_sword", <atop:mud_sword>,
[[null,<erebus:umberstone:1>,null],
[null,<erebus:umberstone:1>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("umber_pickaxe", <atop:mud_pickaxe>,
[[<erebus:umberstone:1>,<erebus:umberstone:1>,<erebus:umberstone:1>],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShapedMirrored("umber_axe", <atop:mud_axe>,
[[<erebus:umberstone:1>,<erebus:umberstone:1>,null],
[<erebus:umberstone:1>,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("umber_shovel", <atop:mud_shovel>,
[[null,<erebus:umberstone:1>,null],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);


recipes.addShaped("copper_sword", <atop:topaz_sword>,
[[null,<erebus:materials:43>,null],
[null,<erebus:materials:43>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_pickaxe", <atop:topaz_pickaxe>,
[[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_axe", <atop:topaz_axe>,
[[<erebus:materials:43>,<erebus:materials:43>,null],
[<erebus:materials:43>,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_shovel", <atop:topaz_shovel>,
[[null,<erebus:materials:43>,null],
[null,<ore:stickWood>,null],
[null,<ore:stickWood>,null]
]);

recipes.addShaped("copper_helmet", <atop:topaz_helmet>,
[[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>],
[null,null,null]
]);

recipes.addShaped("copper_chestplate", <atop:topaz_chestplate>,
[[<erebus:materials:43>,null,<erebus:materials:43>],
[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>]
]);

recipes.addShaped("copper_leggings", <atop:topaz_leggings>,
[[<erebus:materials:43>,<erebus:materials:43>,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>]
]);

recipes.addShaped("copper_boots", <atop:topaz_boots>,
[[null,null,null],
[<erebus:materials:43>,null,<erebus:materials:43>],
[<erebus:materials:43>,null,<erebus:materials:43>]
]);
