#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;
import mods.dropt.Dropt;
import mods.jei.JEI;

recipes.removeByMod("timeisup");


mods.recipestages.Recipes.addShaped("chrono_absolution", "unlocked_chrono_absolution", <contenttweaker:chrono_absolution>,[
    [null, <minecraft:quartz>, null],
    [<minecraft:quartz>, <contenttweaker:unstable_sand>, <minecraft:quartz>],
    [null, <minecraft:quartz>, null]]);


mods.recipestages.Recipes.addShaped("unstable_sand", "unlocked_chrono_absolution", <contenttweaker:unstable_sand>,[
    [<contenttweaker:raw_unstable_infernium>, <nethercraft:ghast_bomb>, <contenttweaker:raw_unstable_infernium>],
    [<nethercraft:ghast_bomb>, <minecraft:blaze_powder>, <nethercraft:ghast_bomb>],
    [<contenttweaker:raw_unstable_infernium>, <nethercraft:ghast_bomb>, <contenttweaker:raw_unstable_infernium>]]);


mods.recipestages.Recipes.addShapeless("chrono_anchor", "unlocked_chrono_anchor", <timeisup:timer_anchor>,[
    <contenttweaker:soul_anchor>,
    <timeisup:timer_bonus>]);

<timeisup:timer_anchor>.maxDamage = 1;  


