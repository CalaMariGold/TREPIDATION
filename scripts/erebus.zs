#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.vanillaanvilrepair.addRepairEntry;
import moretweaker.erebus.Composter;


recipes.removeByRecipeName("erebus:blaze_powder");


JEI.removeAndHide(<erebus:bamboo_pipe>);
JEI.removeAndHide(<erebus:bambucket>);
JEI.removeAndHide(<erebus:silk>);
JEI.removeAndHide(<erebus:bamboo_bridge>);
JEI.removeAndHide(<erebus:bamboo_ladder>);

// Remove goggles, wings and larva items
JEI.removeAndHide(<erebus:compound_goggles>);
JEI.removeAndHide(<erebus:rein_compound_goggles>);
JEI.removeAndHide(<erebus:glider_chestplate>);
JEI.removeAndHide(<erebus:glider_chestplate_powered>);
JEI.removeAndHide(<erebus:materials:27>);
JEI.removeAndHide(<erebus:erebus_food:0>); // Beetle larva
JEI.removeAndHide(<erebus:erebus_food:1>);// Cooked beetle larva  

// Remove varnished blocks
JEI.removeAndHide(<erebus:stairs_varnished>);
JEI.removeAndHide(<erebus:slab_planks_varnished>);
JEI.removeAndHide(<erebus:fence_varnished>);
JEI.removeAndHide(<erebus:fence_gate_varnished>);

// Remove whetstone
recipes.remove(<erebus:whetstone>);
JEI.removeAndHide(<erebus:whetstone>);

val umberstone as IItemStack = <erebus:umberstone>;
umberstone.hardness = 0.5;

JEI.removeAndHide(<erebus:death_compass>);
recipes.remove(<erebus:liquifier>);
recipes.remove(<erebus:bamboo_extender>);
// composter recipes removal thru iterating thru each item and definition
var compostMatArray = itemUtils.getItemsByRegexRegistryName(".*:.*") as IItemStack[];
Composter.removeAll(compostMatArray);
for item in compostMatArray{
    for i in 0 to 20{
        Composter.remove(item.definition.makeStack(i));
    }
}
JEI.removeAndHide(<erebus:composter>);


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


furnace.addRecipe(<contenttweaker:cooked_bug_meat>, <contenttweaker:bug_meat>, 1.0);


// jade pickaxe requires withering infernium pickaxe
// reduces inventory bloat
recipes.remove(<erebus:jade_pickaxe>);
recipes.addShaped("jade_pickaxe", <erebus:jade_pickaxe>,
[[<erebus:materials:1>,<erebus:materials:1>,<erebus:materials:1>],
[null,<nethercraft:pyridium_pickaxe:*>,null],
[null,null,null]
]);

