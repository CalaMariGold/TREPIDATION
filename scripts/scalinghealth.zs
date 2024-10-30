#loader crafttweaker reloadable
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.rockytweaks.Anvil;
import mods.ltt.LootTable;
import mods.dropt.Dropt;


recipes.addShapeless("heartcrystals", <scalinghealth:crystalshard>*8,[<scalinghealth:heartcontainer>]);


recipes.remove(<scalinghealth:heartdust>);
recipes.addShapeless("heartdust", <scalinghealth:heartdust>*2,[<scalinghealth:crystalshard>]);


recipes.remove(<scalinghealth:healingitem:1>);
recipes.addShapeless("medkit", <scalinghealth:healingitem:1>, [<scalinghealth:healingitem>, <nethercraft:foulite_dust>, <scalinghealth:heartdust>]);

recipes.remove(<scalinghealth:healingitem>);
recipes.addShaped("bandage", <scalinghealth:healingitem>,
[[null,null,null],
[<nethercraft:foulite_dust>,<nethercraft:foulite_dust>,<nethercraft:foulite_dust>],
[<ore:paper>,<ore:paper>,<ore:paper>]
]);

recipes.addShaped("bandage2", <scalinghealth:healingitem>,
[[null,null,null],
[<scalinghealth:heartdust>,<scalinghealth:heartdust>,<scalinghealth:heartdust>],
[<ore:paper>,<ore:paper>,<ore:paper>]
]);

