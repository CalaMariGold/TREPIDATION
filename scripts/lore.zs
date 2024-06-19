import crafttweaker.game.IGame;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import mods.jei.JEI;


<corpsecomplex:scroll>.displayName = "§cDreadstone Tablet";
<corpsecomplex:scroll>.addTooltip("§3Use to teleport to your last death");
<corpsecomplex:scroll>.addTooltip("§3Does not drop on death");
<corpsecomplex:scroll>.removeTooltip("Return to death location");
JEI.addDescription(<corpsecomplex:scroll>,"For millennia, the Dreadswine have roamed the suffocating abyss of the Nether in ceaseless agony. Once beings of flesh and soul, they were damned to an undead disgusting existence by their own doing, their humanity dissolved in a mire of despair and malevolence. These wretched creatures will lash out at any who draw near, their attacks persisting even through their target's rebirth. Driven by a single purpose, they scour the infernal depths for the fabled Dreadstone Tablet, an ancient relic from before their fall, which promises the return of their lost souls and a harrowing passage back to the moment of their undoing. Yet, for these lost souls, they have only come across fragments; cruel teases of the oblivion they crave.");

<contenttweaker:dreadstone_fragment>.displayName = "Dreadstone Fragment";
<contenttweaker:dreadstone_fragment>.addTooltip("§3Does not drop on death");
<contenttweaker:dreadstone_fragment>.addTooltip("§oWhen touched, the fragment makes a subtle vibration in sync with the pulse of your heartbeat");
JEI.addDescription(<contenttweaker:dreadstone_fragment>,"For millennia, the Dreadswine have roamed the suffocating abyss of the Nether in ceaseless agony. Once beings of flesh and soul, they were damned to an undead disgusting existence, their humanity dissolved in a mire of despair and malevolence. These wretched creatures will lash out at any who draw near, their attacks persisting even through their target's rebirth. Driven by a single purpose, they scour the infernal depths for the fabled Dreadstone Tablet, an ancient relic that promises the return of their lost souls and a harrowing passage back to the moment of their undoing. Yet, for these lost souls, they have only come across fragments; cruel teases of the oblivion they crave.");


<contenttweaker:soul_anchor>.displayName = "§cSoul Anchor";
<contenttweaker:soul_anchor>.addTooltip("§3Use to set your spawn point to where you are standing");
<contenttweaker:soul_anchor>.addTooltip("§3Use at dimension start for safe spawn, avoiding barrier falls");
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

JEI.addDescription(<enderskills:token>,"The Trace of Death stands as a cursed artifact. Its origin remains an enigma, whispered in hushed tones and often lost within fear-stricken narratives. Its presence is marked by a cold, ominous aura that seems to permeate the air around it.
When shattered, the Trace of Death unleashes a torrent of spectral energies reaching out to ensnare the wandering souls that still cling to this realm. These souls are then forcably drawn towards the one who shattered the artifact, granting them not only an infusion of raw power but also a glimpse into the secrets and knowledge that these spirits once held.
However, such power comes at a steep cost, for the Trace of Death can drive even the most level-headed adventurer to madness and despair. Its effects are said to linger long after the artifact is destroyed, tainting the very essence of those who wield it and beckoning forth a specific entity who trives in the shadows.
Few dare to seek out the Trace of Death, for its power is as volatile as it is mysterious, and those who venture into the unknown are often consumed by the very darkness that they sought to master. Yet, for the brave, the Trace of Death represents an opportunity to tap into the forbidden knowledge and power that this world has to offer, no matter the cost.");

<enderskills:book>.displayName = "§cGrimoire of the Veil";
<enderskills:book>.addTooltip("§3Does not drop on death");
JEI.addDescription(<enderskills:book>,"There are 3 classes you can delve into: Defense, Mobility, and Offense. Each have multiple subclasses. 
Press ALT + [number] to use an ability and G and H to cycle through ability groups. Unlocking skills cost XP and Souls. You can obtain Souls by breaking Traces of Death. Soul prices increase as you spend and there is a cap of 9 Souls, so spend wisely. You can always reset to try a new build.");

// Nether
JEI.addDescription(<nethercraft:foulite_dust>,"Foulite Dust, a greenish luminescent substance found throughout The Nether, is believed to originate from the fusion of foul energies and remnants of organic matter. Despite its ominous origins, this highly flammable and volatile dust serves as a valuable resource for illumination, smelting, and oddly enough helps repair wounds. A symbol of hope and ingenuity, Foulite Dust demonstrates the resilience of the human spirit, even when faced with the horrors that pervade The Nether.");

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
JEI.addDescription(<nethercraft:neridium_ingot>,"Veilstrium is a rare and mystical ore that can only be found within the treacherous depths of The Nether. Born from the amalgamation of ethereal energies and the elemental forces of the underworld, it is said to have formed when the essence of countless lost souls seeped into the very fabric of the realm, eventually coalescing and crystallizing into this unique purplish mineral. Veilstrium's origin grants it a supernatural resilience, making it a valuable material for crafting weapons and armor. Its unique properties allow it to absorb and dissipate the malevolent energies that pervade The Nether, bestowing its wielders with an otherworldly endurance. Legends whisper that those who possess items crafted from Veilstrium are not only protected from the dangers of The Nether but may also find themselves attuned to the whispers of the long-forgotten souls trapped within the ore. Such spectral guidance can grant travelers valuable insights and instincts, allowing them to navigate the treacherous realms with greater ease.");


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

JEI.addDescription(<nethercraft:ghast_bones>,"With their ghostly white skin, tentacle-like appendages, and piercing wails, Ghasts have become one of the most iconic symbols of this cursed realm.
Deadly as they may be, they play a crucial role in the creation of Veilstrium tools. Their bones possess a unique resonance that enables them to interact with the otherworldly properties of Veilstrium.
Some even claim that the bones of Ghasts hold a deeper significance, serving as a conduit between the physical realm and the ethereal plane that underlies some aspects of The Nether.");

JEI.addDescription(<minecraft:blaze_rod>,"Infernal rods, obtained only by slaying the fearsome Infernals and their mightier kin, the Infernal Juggernauts, serve as a potent source of fuel and illumination. When combined with the fiery essence of Infernium, they can be forged into powerful artifacts and weapons that harness intense heat and destructive energy.");

JEI.addDescription(<nethercraft:glowood_log>,"Glowood Trees are the eerie flora that dot the burning landscape of The Nether. These ominous trees are composed of a unique blend of Glowstone and Basalt, imbuing them with both the eerie luminescence of the former and the explosive resistance of the latter. They are home to the elusive Gloworms, small creatures that dwell within the leaves of the trees. These bioluminescent insects are prized for their glow and their nourishment, leaving them to be very useful for those seeking to survive in The Nether.");
JEI.addDescription(<nethercraft:glow_apple>,"Glowood Trees are the eerie flora that dot the burning landscape of The Nether. These ominous trees are composed of a unique blend of Glowstone and Basalt, imbuing them with both the eerie luminescence of the former and the explosive resistance of the latter. They are home to the elusive Gloworms, small creatures that dwell within the leaves of the trees. These bioluminescent insects are prized for their glow and their nourishment, leaving them to be very useful for those seeking to survive in The Nether.");

<simpleores:tin_pickaxe:*>.displayName = "Quartz Pickaxe";
<simpleores:tin_pickaxe:*>.addTooltip("§3Bone blocks will always drop 2 ghast bones when mined");

<nethercraft:neridium_bow:*>.displayName = "Quartz Bow";
<nethercraft:neridium_bow:*>.addTooltip("§21.0s Draw Speed");
<nethercraft:neridium_bow:*>.addTooltip("§21.0 Arrow Velocity");
<nethercraft:neridium_bow:*>.addTooltip("§23-4 Attack Damage");




<nethercraft:neridium_lighter>.displayName = "Quartz Lighter";
<nethercraft:ghast_bomb>.addTooltip("§oA volatile explosive, awaiting ignition by a Quartz Lighter");
<nethercraft:ghast_marrow>.addTooltip("§oAn unstable substance, harboring explosive potential");

<mysticstaffs:fire_staff:*>.displayName = "§cStaff of Infernal";
<mysticstaffs:fire_staff:*>.addTooltip("§oA potent weapon that engulfs nearby enemies in a searing inferno");
<contenttweaker:vitality_orb>.displayName = "Orb of Veilheart";
JEI.addDescription(<contenttweaker:vitality_orb>,"The Orb of Veilheart, a miraculous fusion of ethereal Veilstrium and enigmatic Foulite dust, possesses a unique duality that unlocks its potent soul-healing powers. The Veilstrium's celestial energies cleanse and purify the spirit, while the Foulite dust's grounding properties restore balance and stability to the physical realm, harmoniously mending both body and soul.");

<mysticstaffs:heal_staff:*>.displayName = "§cStaff of Veilheart";
<mysticstaffs:heal_staff:*>.addTooltip("§oA benevolent staff that rejuvenates the soul and body of allies");
<mysticstaffs:heal_staff:*>.addTooltip("§3Uses 2 dash feathers");

<nethercraft:ghast_bones>.addTooltip("§oOccasionally harvested from bone blocks floating in the searing lava oceans");


// Deep Dark
<quark:elder_prismarine:2>.displayName = "Deep Stone";

// Misc
<quark:soul_compass>.addTooltip("§oA guiding relic, directing you to the site of your most recent demise");
<minecraft:fire_charge>.addTooltip("§oA blazing projectile, detonating with fiery force upon impact");
<scalinghealth:healingitem:0>.addTooltip("§oProvide healing and can be combined to form a medkit for enhanced recovery");
<scalinghealth:heartcontainer>.removeTooltip("Increases maximum health");
<scalinghealth:heartcontainer>.addTooltip("§oA precious relic of vitality, bestowing its user with a permanently increased life force");
<scalinghealth:heartcontainer>.addTooltip("§3Uses 2 levels");
<minecraft:torch>.addTooltip("§3Does not drop on death");
<artifacts:shiny_red_balloon>.addTooltip("§3You must wait until the end of the jump animation to initiate double jump with this equipped");


