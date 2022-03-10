import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;

JEI.removeAndHide(<erebus:death_compass>);

recipes.remove(<erebus:umber_furnace>);
recipes.addShaped("umber_furnace", <erebus:umber_furnace>,
[[<erebus:umberstone:1>,<erebus:umberstone:1>,<erebus:umberstone:1>],
[<erebus:umberstone:1>,null,<erebus:umberstone:1>],
[<erebus:umberstone:1>,<erebus:umberstone:1>,<erebus:umberstone:1>]
]);

recipes.remove(<erebus:jade_shield>);
recipes.addShaped("jade_shield", <erebus:jade_shield>,
[[<erebus:materials:1>,<erebus:materials:43>,<erebus:materials:1>],
[<erebus:materials:1>,null,<erebus:materials:1>],
[null,<erebus:materials:1>,null]
]);
