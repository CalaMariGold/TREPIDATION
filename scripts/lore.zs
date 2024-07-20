#loader crafttweaker reloadable
import crafttweaker.game.IGame;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Lore entries
<contenttweaker:dreadswine_entry>.displayName = "§cElara's Journal - Entry #7";
<contenttweaker:dreadswine_entry>.addTooltip("§oA tattered page that was torn from a journal");
<contenttweaker:dreadswine_entry>.addTooltip("§3Right-click to add to your Journal");
<contenttweaker:foulite_dust_entry>.displayName = "§cElara's Journal - Entry #9";
<contenttweaker:foulite_dust_entry>.addTooltip("§oA tattered page that was torn from a journal");
<contenttweaker:foulite_dust_entry>.addTooltip("§3Right-click to add to your Journal");
<contenttweaker:nether_wraith_entry>.displayName = "§cElara's Journal - Entry #5";
<contenttweaker:nether_wraith_entry>.addTooltip("§oA tattered page that was torn from a journal");
<contenttweaker:nether_wraith_entry>.addTooltip("§3Right-click to add to your Journal");
<contenttweaker:veilstrium_entry>.displayName = "§cElara's Journal - Entry #11";
<contenttweaker:veilstrium_entry>.addTooltip("§oA tattered page that was torn from a journal");
<contenttweaker:veilstrium_entry>.addTooltip("§3Right-click to add to your Journal");
<contenttweaker:infernium_entry>.displayName = "§cElara's Journal - Entry #15";
<contenttweaker:infernium_entry>.addTooltip("§oA tattered page that was torn from a journal");
<contenttweaker:infernium_entry>.addTooltip("§3Right-click to add to your Journal");
<contenttweaker:glowood_entry>.displayName = "§cElara's Journal - Entry #2";
<contenttweaker:glowood_entry>.addTooltip("§oA tattered page that was torn from a journal");
<contenttweaker:glowood_entry>.addTooltip("§3Right-click to add to your Journal");

<corpsecomplex:scroll>.displayName = "§cDreadstone Tablet";
<corpsecomplex:scroll>.addTooltip("§3Use to teleport to your last death");
<corpsecomplex:scroll>.addTooltip("§3Does not drop on death");
<corpsecomplex:scroll>.removeTooltip("Return to death location");
<contenttweaker:dreadstone_fragment>.displayName = "Dreadstone Fragment";
<contenttweaker:dreadstone_fragment>.addTooltip("§3Does not drop on death");
<contenttweaker:dreadstone_fragment>.addTooltip("§oWhen touched, the fragment makes a subtle vibration in sync with the pulse of your heartbeat");


<contenttweaker:soul_anchor>.displayName = "§cSoul Anchor";
<contenttweaker:soul_anchor>.addTooltip("§3Use to set your spawn point to where you are standing");
<contenttweaker:soul_anchor>.addTooltip("§3Does not drop on death");
<contenttweaker:soul_anchor>.addTooltip("§3SINGLE USE");
<contenttweaker:soul_anchor>.addTooltip("§oWhen brought to your ear, you can hear faint unsettling laughter");
JEI.addDescription(<contenttweaker:soul_anchor>,"Bound in wood and sealed with ancient blood, the Soul Anchor hums in the dark, its eerie blue aura a beacon to the lost. Use it, and find yourself forever tethered to its haunting pull. A new life granted, but at what cost? For each return bears a toll on the soul's uncharted map.");




// Food
<contenttweaker:scrambled_magma_eggs>.displayName = "Scrambled Magma Eggs";
<contenttweaker:scrambled_magma_eggs>.addTooltip("§3Gives Fire Resistance for 10s");

<contenttweaker:deviled_egg_sandwich>.displayName = "§cDeviled Egg Sandwich";
<contenttweaker:deviled_egg_sandwich>.addTooltip("§3Gives Fire Resistance and Strength for 30s");

<nethercraft:slime_eggs>.displayName = "Magma Eggs";
<nethercraft:slime_eggs>.addTooltip("§oCan be hurled at foes or used to create a balanced meal");
<nethercraft:devil_bread>.addTooltip("§oA smoldering delicacy, paired exquisitely with Magma Eggs");
<nethercraft:devil_bread>.addTooltip("§3Gives Strength for 10s");
<nethercraft:glow_apple>.displayName = "Glow Worm";

<contenttweaker:bug_meat>.displayName = "Bug Meat";
<contenttweaker:bug_meat>.addTooltip("§oA pulsating lump of slimy chitin and twitching legs");
<contenttweaker:cooked_bug_meat>.displayName = "Cooked Bug Meat";
<contenttweaker:cooked_bug_meat>.addTooltip("§oAlthough cooked, it doesn't taste much better");

// Skills
<enderskills:token>.displayName = "§cTrace of Death";
<enderskills:token>.addTooltip("§3Use to break and add to your Souls");

<enderskills:book>.displayName = "§cGrimoire of the Veil";
<enderskills:book>.addTooltip("§3Does not drop on death");


// Infernium
<nethercraft:pyridium_ore>.displayName = "Infernium Ore";
<nethercraft:pyridium_block>.displayName = "Infernium Block";
<nethercraft:pyridium_ingot>.displayName = "Infernium Ingot";
JEI.addDescription(<nethercraft:pyridium_ingot>,"Infernium is a rare and powerful ore found exclusively within the The Nether. Born from the ashes of ancient infernal beings that once ruled this realm with their unyielding power of fire and destruction, Infernium is the embodiment of their eternal wrath and fury. This yellow-hued ore glows with an inner light, as if the very souls of those ancient entities still smolder within its core. Harnessing the destructive essence of Infernium requires great courage and skill. When fused with infernal rods and ghast bones, Infernium can create an item capable of summoning the Infernal Fortress.");


<nethercraft:pyridium_sword>.displayName = "Infernium Sword";

<contenttweaker:wither_infernium>.displayName = "§cWithering Infernium Ingot";
<contenttweaker:wither_infernium>.addTooltip("§oA destructive alloy, impossible to craft by mortals. When held, your hands slowly begin to dry and crumble");
<nethercraft:pyridium_pickaxe:*>.displayName = "§cWithering Infernium Pickaxe";
<nethercraft:pyridium_pickaxe:*>.addTooltip("§oA tool imbued with the power to wither away an otherwise impervious barrier");
<nethercraft:pyridium_pickaxe:*>.addTooltip("§3When mining the purple barrier, be sure to TAP left click to break it. Don't hold it down.");



<nethercraft:pyridium_axe>.displayName = "Infernium Axe";
<nethercraft:pyridium_shovel>.displayName = "Infernium Shovel";
<nethercraft:pyridium_bow>.displayName = "Infernium Bow";

<nethercraft:pyridium_bow:*>.addTooltip("§20.75s Draw Speed");
<nethercraft:pyridium_bow:*>.addTooltip("§21.55 Arrow Velocity");
<nethercraft:pyridium_bow:*>.addTooltip("§24-6 Attack Damage");



<minecraft:blaze_rod>.displayName = "Infernal Rod";
<minecraft:blaze_powder>.displayName = "Infernal Powder";


// Veilstrium
<nethercraft:neridium_ore>.displayName = "Veilstrium Ore";
<nethercraft:neridium_block>.displayName = "Veilstrium Block";
<nethercraft:neridium_ingot>.displayName = "Veilstrium Ingot";


<nethercraft:neridium_sword>.displayName = "Veilstrium Sword";
<nethercraft:neridium_pickaxe>.displayName = "Veilstrium Pickaxe";
<nethercraft:neridium_axe>.displayName = "Veilstrium Axe";
<nethercraft:neridium_shovel>.displayName = "Veilstrium Shovel";
<nethercraft:neridium_bucket>.displayName = "Veilstrium Bucket";
<nethercraft:neridium_helmet>.displayName = "Veilstrium Helmet";
<nethercraft:neridium_chestplate>.displayName = "Veilstrium Chestplate";
<nethercraft:neridium_leggings>.displayName = "Veilstrium Leggings";
<nethercraft:neridium_boots>.displayName = "Veilstrium Boots";

<contenttweaker:riftbreaker_crystal>.displayName = "§cRiftbreaker Crystal";
<contenttweaker:riftbreaker_crystal>.addTooltip("§oAn explosive gem that obliterates everything in its vertical path and catapults all allies skyward");

<contenttweaker:infernal_fortress_scepter>.displayName = "§cScepter of Infernal Conjuring";
<contenttweaker:infernal_fortress_scepter>.addTooltip("§oA formidable artifact that holds the power to materialize a gargantuan fortress, shrouded in whispers of an ancient and fearsome presence");
JEI.addDescription(<contenttweaker:infernal_fortress_scepter>,"In the heart of shadows where whispers wane and wax,
Lies a fortress born from the void's insidious cracks.
Within these walls of despair and smoldering fright,
The Wither toiled under the cloak of eternal night.
Forging a union of fire and decay,
Infernium and withering power did he sway.
Born from despair and flame,
A material so potent, it whispered his name.
In halls echoing with a ghastly, unspoken fear,
The secret of escape, in shadows, draws near.
For only this alloy, both dreadful and dire,
Can shatter the barrier, birthed in hellfire.");


JEI.addDescription(<minecraft:blaze_rod>,"Infernal rods, obtained by slaying the fearsome Infernals, serve as a potent source of fuel and illumination. When combined with the fiery essence of Infernium, they can be forged into powerful artifacts and weapons that harness intense heat and destructive energy.");


<simpleores:tin_pickaxe:*>.displayName = "Quartz Pickaxe";
<simpleores:tin_pickaxe:*>.addTooltip("§3Bone blocks will always drop 2 ghast bones when mined");

<nethercraft:neridium_bow:*>.displayName = "Quartz Bow";
<nethercraft:neridium_bow:*>.addTooltip("§21.0s Draw Speed");
<nethercraft:neridium_bow:*>.addTooltip("§21.0 Arrow Velocity");
<nethercraft:neridium_bow:*>.addTooltip("§23-4 Attack Damage");




<nethercraft:neridium_lighter>.displayName = "Quartz Lighter";


<mysticstaffs:fire_staff:*>.displayName = "§cStaff of Infernal";
<mysticstaffs:fire_staff:*>.addTooltip("§oA potent weapon that engulfs nearby enemies in a searing inferno");
<contenttweaker:vitality_orb>.displayName = "Orb of Veilheart";
JEI.addDescription(<contenttweaker:vitality_orb>,"The Orb of Veilheart, a miraculous fusion of Veilstrium and Foulite dust, possesses a unique duality that unlocks its potent soul-healing powers. Veilstrium's celestial energies cleanse the spirit, while the Foulite dust's grounding properties restore balance and stability to the physical realm, harmoniously mending both body and soul.");

<mysticstaffs:heal_staff:*>.displayName = "§cStaff of Veilheart";
<mysticstaffs:heal_staff:*>.addTooltip("§oA benevolent staff that rejuvenates the soul and body of allies");
<mysticstaffs:heal_staff:*>.addTooltip("§3Uses 2 dash feathers");

<nethercraft:ghast_bones>.displayName = "Nether Wraith Bones";
<nethercraft:ghast_rod>.displayName = "Nether Wraith Rod";
<nethercraft:ghast_marrow>.displayName = "Nether Wraith Marrow";
<nethercraft:ghast_bomb>.displayName = "Nether Wraith Bomb";
<nethercraft:ghast_bomb>.addTooltip("§oA volatile explosive, awaiting ignition by a Quartz Lighter");
<nethercraft:ghast_marrow>.addTooltip("§oAn unstable substance, harboring explosive potential");
<nethercraft:ghast_bones>.addTooltip("§oOccasionally harvested from bone blocks floating in the searing lava oceans");


// Deep Dark
<quark:elder_prismarine:2>.displayName = "Deep Stone";

// Misc
<quark:soul_compass>.addTooltip("§oA guiding relic, directing you to the site of your most recent demise");
<minecraft:fire_charge>.addTooltip("§oA blazing projectile, detonating with fiery force upon impact");
<scalinghealth:healingitem:0>.addTooltip("§oCan be combined to form a medkit for enhanced recovery");
<scalinghealth:heartcontainer>.removeTooltip("Increases maximum health");
<scalinghealth:heartcontainer>.addTooltip("§oA precious relic of vitality, bestowing its user with a permanently increased life force");
<scalinghealth:heartcontainer>.addTooltip("§3Uses 2 levels");
<minecraft:torch>.addTooltip("§3Does not drop on death");
<artifacts:shiny_red_balloon>.addTooltip("§3You must wait until the end of the jump animation to initiate double jump with this equipped");


