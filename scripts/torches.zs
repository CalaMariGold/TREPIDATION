import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;


JEI.removeAndHide(<erebus:bamboo_torch>);
JEI.removeAndHide(<nethercraft:foulite_torch>);
JEI.removeAndHide(<nethercraft:charcoal_torch>);
JEI.removeAndHide(<quark:arrow_torch>);


recipes.remove(<minecraft:torch>);
recipes.addShapeless("torch", <minecraft:torch> * 2,[<ore:coal>, <ore:stickWood>]);
        
        