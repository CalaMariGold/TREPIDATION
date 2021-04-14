import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;

<tag:items:forge:rods>.add(<item:nethercraft:glowood_stick>);
<tag:items:forge:rods/wooden>.add(<item:nethercraft:glowood_stick>);

craftingTable.removeRecipe(<item:nethercraft:netherrack_bow>);

craftingTable.addShaped("netherrack_bow", <item:nethercraft:netherrack_bow>, [
    [<item:minecraft:air>, <tag:items:forge:rods/wooden>, <item:minecraft:string>],
    [<item:minecraft:netherrack>, <item:minecraft:air>, <item:minecraft:string>],
    [<item:minecraft:air>, <tag:items:forge:rods/wooden>, <item:minecraft:string>]
]);