import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;


JEI.removeAndHide(<erebus:bamboo_torch>);
JEI.removeAndHide(<nethercraft:foulite_torch>);
JEI.removeAndHide(<nethercraft:charcoal_torch>);
JEI.removeAndHide(<quark:arrow_torch>);
JEI.removeAndHide(<realistictorches:torch_unlit>);
JEI.removeAndHide(<minecraft:torch>);

JEI.removeAndHide(<realistictorches:glowstone_crystal>);
JEI.removeAndHide(<realistictorches:glowstone_paste>);


recipes.remove(<realistictorches:torch_lit>);
recipes.addShapeless("lit torch", <realistictorches:torch_lit>,[<ore:coal>, <ore:stickWood>]);

recipes.remove(<realistictorches:matchbox>);
recipes.addShapeless("match box", <realistictorches:matchbox>,[<ore:slabWood>, <ore:paper>]);
        
        
        
        
        