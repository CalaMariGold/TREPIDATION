import crafttweaker.game.IGame;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Food
<contenttweaker:scrambled_magma_eggs>.displayName = "Scrambled Magma Eggs";
<contenttweaker:scrambled_magma_eggs>.addTooltip("§3Gives Fire Resistance for 10s");

<contenttweaker:deviled_egg_sandwich>.displayName = "§cDeviled Egg Sandwich";
<contenttweaker:deviled_egg_sandwich>.addTooltip("§3Gives Fire Resistance and Strength for 30s");

<nethercraft:slime_eggs>.displayName = "Magma Eggs";
<nethercraft:slime_eggs>.addTooltip("Can be thrown or used to make a delicious meal");
<nethercraft:devil_bread>.addTooltip("Goes really well with Magma Eggs");
<nethercraft:devil_bread>.addTooltip("§3Gives Strength for 10s");
<nethercraft:glow_apple>.displayName = "Glow Worm";


// Skills
<enderskills:token>.displayName = "§cTrace of Death";
<enderskills:token>.addTooltip("Right-click to break and add to your Souls");
<enderskills:book>.displayName = "§cSkill Book";
<enderskills:book>.addTooltip("Press R on this item to learn about skills");
<enderskills:book>.addTooltip("Does not drop on death");
JEI.addDescription(<enderskills:book>,"There are 3 main classes you can delve into and combine: Defense, Mobility, and Offense. Each of these classes have multiple subclasses (use the arrows on the bottom corners). Press SHIFT + [number] to use an ability and G and H to cycle through class ability sets. Unlocking most skills cost XP and Souls. You can obtain Souls by breaking Traces of Death, which are dropped by mobs. Soul prices increase as you spend, and there is a soft-cap of how many Souls you can have (9), meaning that you can't unlock everything, so spend wisely. You can always start a new world to try a new build!");

// Nether
<adfinders:metals_finder>.displayName = "Pyridium Finder";
<adfinders:metals_finder>.addTooltip("An enigmatic and ancient artifact that reveals hidden deposits of pyridium.");
<simpleores:tin_pickaxe>.displayName = "Quartz Pickaxe";
<simpleores:tin_pickaxe>.addTooltip("§3Bone blocks will always drop 2 ghast bones when mined");
<nethercraft:ghast_bomb>.addTooltip("Can be lit with a Neridium Lighter");
<nethercraft:ghast_marrow>.addTooltip("Highly flammable and explosive material");

// Deep Dark
<quark:elder_prismarine:2>.displayName = "Deep Stone";

// Misc
<quark:soul_compass>.addTooltip("Points to your most recent death location");
<minecraft:fire_charge>.addTooltip("Can be thrown");
<scalinghealth:healingitem:0>.addTooltip("§3Can be combined into a medkit.");


