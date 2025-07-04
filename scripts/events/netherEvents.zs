#loader crafttweaker reloadable
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;

import crafttweaker.data.IData;

import crafttweaker.enchantments.IEnchantmentDefinition;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityItem;

import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.event.EntityLivingUseItemEvent.Finish;
import crafttweaker.event.PlayerAnvilUpdateEvent;
import crafttweaker.event.PlayerFillBucketEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.PlayerSleepInBedEvent;
import crafttweaker.event.PlayerTickEvent;

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;

import crafttweaker.player.IPlayer;

import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;

import crafttweaker.util.Position3f;

import mods.hungertweaker.events.HungerEvents;

import crafttweaker.api.event.timeisup.TimeIsUpEvent;
import crafttweaker.events.timeisup.EventManager;
import crafttweaker.api.event.timeisup.TickEvent;
import crafttweaker.world.IWorldInfo;
import crafttweaker.event.PlayerAdvancementEvent;
import mods.contenttweaker.Commands;
import mods.contenttweaker.ActionResult;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.PlayerLeftClickBlockEvent;
import crafttweaker.util.IRandom;


// echo of betrayal & ancient infernal brick
static abberrant_mana as IItemStack = <da:abberrant_eye>;
events.onPlayerInteractBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack;     
        if ((itemStack.definition.id).matches(abberrant_mana.definition.id)) {  
            if(event.block.displayName == "§cAncient Infernal Brick"){

                // if player killed the oracle, randomly spawn ashen catalyst and infernal mobs
                if(event.player.hasGameStage("killedOracle")){
                
                    Commands.call("summon item " + event.x + " " + event.y + " " + event.z + " {Item:{id:\"da:flame_metal_scrap\", Count:1}}", event.player, event.entity.world, true, true);
                    Commands.call("setblock " + event.x + " " + event.y + " " + event.z + " minecraft:air", event.player, event.entity.world, true, true);

                    
                    itemStack.mutable().shrink(1);

                    if(event.world.random.nextInt(0, 2) == 1){
                        if(event.world.random.nextInt(0, 2) == 1){
                            val worldY = event.y + 1.0;
                            Commands.call("setblock " + event.x + " " + worldY + " " + event.z + " minecraft:air", event.player, event.entity.world, true, true);

                            Commands.call("summon primitivemobs:blazing_juggernaut " + event.x + " " + worldY + " " + event.z + "", event.player, event.world, true, true);
                            Commands.call("playsound enderskills:fireball_explode player @p ~ ~ ~ 1.0 1.0 1.0", event.player, event.world, true, true);
                        } 
                        else {   
                            val worldY = event.y + 1.0;
                            Commands.call("setblock " + event.x + " " + worldY + " " + event.z + " minecraft:air", event.player, event.entity.world, true, true);
                                                     
                            Commands.call("summon minecraft:blaze " + event.x + " " + event.y + " " + event.z + "", event.player, event.world, true, true);
                            Commands.call("playsound enderskills:fireball_explode player @p ~ ~ ~ 1.0 1.0 1.0", event.player, event.world, true, true);
                        }
                    }
                    else {
                        Commands.call("playsound enderskills:flares player @p ~ ~ ~ 1.0 1.0 1.0", event.player, event.world, true, true);
                    }
                }

                // if player did not kill the oracle, give hint
                else {
                    event.player.sendChat("§o§cThe artifact pulses weakly against the Infernal brick and dissipates. You sense an ancient power lock secrets behind trial and judgement.");
                    Commands.call("playsound enderskills:syphon player @p ~ ~ ~ 100 0.6", event.player, event.world, true, true);
                    itemStack.mutable().shrink(1);
                }
            } 
            else {
                if(isNull(event.player.data.clickedEchoOfBetrayal) || event.player.data.clickedEchoOfBetrayal == false){  
                    event.player.sendChat("§o§cAs you stare into the eye of this artifact, it seems to draw you to an ancient stone of some kind—a stone where buried power might yet be unearthed.");
                    Commands.call("effect @e[type=da:nether_pyre] glowing", event.player, event.world, true, true);
                    Commands.call("playsound enderskills:contaminate player @p", event.player, event.world, true, true);
                    event.player.update({clickedEchoOfBetrayal: true});
                }
            }
        }  
        
    }
});




static veilstriumPick as IItemStack = <nethercraft:neridium_pickaxe:*>;
static netherrackPick as IItemStack = <nethercraft:netherrack_pickaxe:*>;
static glowoodPick as IItemStack = <nethercraft:glowood_pickaxe:*>;



events.onPlayerLeftClickBlock(function(event as crafttweaker.event.PlayerLeftClickBlockEvent){
    if(!event.entity.world.isRemote()){
        if(isNull(event.player.data.clickedNetherBarrier) || event.player.data.clickedNetherBarrier == false){       
            val playerHoldItemStack = event.player.currentItem as IItemStack; 
            if(event.block.displayName == "Barrier §4Alpha"){
                if(!isNull(playerHoldItemStack)){
                    if (veilstriumPick.matches(playerHoldItemStack) || netherrackPick.matches(playerHoldItemStack) || glowoodPick.matches(playerHoldItemStack)) {  
                        event.player.sendChat("§cAs you strike the barrier above you, a haunting realization dawns: A tool much stronger than your " + event.player.currentItem.displayName + " will be required to shatter this engimatic veil - one steeped in the essence of Withering, forged by a dark, concealed entity...");
                        Commands.call("playsound quark:item.soul_bead.curse player @p ~ ~ ~ 5.0 1.0 1.0", event.player, event.world, true, true);
                        event.player.update({clickedNetherBarrier: true});
                    }
                }
            }
        }
    }
});

events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if(!event.entity.world.isRemote()){
        if(event.entity.definition.id == <entity:da:flame_knight>.id)
        {
            server.commandManager.executeCommand(server, "gamestage silentadd @a killedOracle");

            EventManager.getInstance().onTimerTick(function(event as TickEvent){
                if(event.player.hasGameStage("preOracle") && event.player.hasGameStage("killedOracle")){

                    var player_name = event.player.name;
                    var totalSecs = event.tick/20;
                    var minutes = (totalSecs % 3600) / 60;
                    var seconds = totalSecs % 60;
                    var timerBonusCount = event.player.data.timerbonus as int;

                    var totalSecondsElasped = 3600 - totalSecs;
                    var secondsElasped = totalSecondsElasped % 60;
                    var minutesElasped = (totalSecondsElasped % 3600) / 60;
                    event.player.sendChat("§a" + player_name + " killed The Ashen Oracle with §c" + minutes + ":" + seconds + " §aleft (" + minutesElasped + ":" + secondsElasped + " elasped)." );
                    if(timerBonusCount >= 1){
                        event.player.sendChat("§aTimer Bonuses Used: §4" + timerBonusCount);
                    }
                    server.commandManager.executeCommand(server, "effect @a regeneration 60");
                    server.commandManager.executeCommand(server, "effect @a invisibility 60");
                    server.commandManager.executeCommand(server, "effect @a minecraft:glowing 60");
                    event.player.sendChat("§6A mysterious yet benevolent aura surrounds you, granting you temporary invisiblity, for now...");

                    server.commandManager.executeCommand(server, "give @a timeisup:timer_bonus 1");
                    server.commandManager.executeCommand(server, "give @a enderskills:book 1");
                    server.commandManager.executeCommand(server, "give @a enderskills:token 1");
                    server.commandManager.executeCommand(server, "give @a scalinghealth:heartcontainer 1");
                    server.commandManager.executeCommand(server, "give @a quark:backpack");

                    server.commandManager.executeCommand(server, "gamestage silentremove @a preOracle");
                }
            });
        }
        if(event.entity.definition.id == <entity:minecraft:wither>.id)
        {
    
            server.commandManager.executeCommand(server, "gamestage silentadd @a killedWither");

            EventManager.getInstance().onTimerTick(function(event as TickEvent){
                if(event.player.hasGameStage("nether") && event.player.hasGameStage("killedWither")){

                    var player_name = event.player.name;
                    var totalSecs = event.tick/20;
                    var minutes = (totalSecs % 3600) / 60;
                    var seconds = totalSecs % 60;
                    var timerBonusCount = event.player.data.timerbonus as int;

                    var totalSecondsElasped = 3600 - totalSecs;
                    var secondsElasped = totalSecondsElasped % 60;
                    var minutesElasped = (totalSecondsElasped % 3600) / 60;
                    event.player.sendChat("§a" + player_name + " killed The Wither with §c" + minutes + ":" + seconds + " §aleft (" + minutesElasped + ":" + secondsElasped + " elasped)." );
                    if(timerBonusCount >= 1){
                        event.player.sendChat("§aTimer Bonuses Used: §4" + timerBonusCount);
                    }
                    server.commandManager.executeCommand(server, "effect @a fire_resistance 120");
                    server.commandManager.executeCommand(server, "effect @a regeneration 120");
                    server.commandManager.executeCommand(server, "effect @a invisibility 120");
                    server.commandManager.executeCommand(server, "effect @a potioncore:slow_fall 120");
                    server.commandManager.executeCommand(server, "effect @a minecraft:glowing 120");
                    event.player.sendChat("§6A mysterious yet benevolent aura surrounds you, granting you temporary invisiblity, for now...");

                    server.commandManager.executeCommand(server, "give @a timeisup:timer_bonus 2");
                    server.commandManager.executeCommand(server, "give @a enderskills:token 3");
                    server.commandManager.executeCommand(server, "give @a scalinghealth:heartcontainer 2");
                    server.commandManager.executeCommand(server, "give @a contenttweaker:riftbreaker_crystal 1");

                    Commands.call("kill @e[type=nethercraft:dark_zombie]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=nethercraft:camouflage_spider]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=nethercraft:bloody_zombie]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=primitivemobs:blazing_juggernaut]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=primitivemobs:festive_creeper]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=primitivemobs:flame_spewer]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=quark:foxhound]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=minecraft:zombie_pigman]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=minecraft:blaze]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=minecraft:wither_skeleton]", event.player, event.world, true, true);
                    Commands.call("kill @e[type=minecraft:ghast]", event.player, event.world, true, true);

                    server.commandManager.executeCommand(server, "gamestage silentremove @a killedOracle");
                    server.commandManager.executeCommand(server, "gamestage silentremove @a nether");
                }
        });
        }
    }
});


// Player interact with Entities
static tablet as IItemStack = <corpsecomplex:scroll>;
static ambition_flame as IItemStack = <da:ambition_flame>;
static dreadstone_fragment as IItemStack = <contenttweaker:dreadstone_fragment>;
events.onPlayerInteractEntity(function(event as crafttweaker.event.PlayerInteractEntityEvent){
    if(!event.world.isRemote()){
        val itemStack1 = event.player.currentItem as IItemStack; 

        // Oracle Summon
            if(event.target.definition.name == "nether_pyre"){
                if (ambition_flame.matches(itemStack1)) {
                        event.player.update({clickedNetherObelisk: true});
                        Commands.call("setworldspawn ~ ~ ~", event.player, event.world, true, true);
                        Commands.call("spawnpoint @a ~ ~ ~", event.player, event.world, true, true);
                        event.player.sendChat("§o§cThe air thickens, the embers pulse—once bound by betrayal, the past now rises to face the living.");
                        event.player.sendChat("§o§9Your soul has been bound to this position.");
                }
                else {
                    if(isNull(event.player.data.clickedNetherObelisk) || event.player.data.clickedNetherObelisk == false){
                        event.player.sendChat("§o§cA chill settles as you approach the obelisk, but nothing stirs. Something waits, requiring a relic forged in wrath and memory");
                        Commands.call("playsound minecraft:ui.toast.in master @p ~ ~ ~ 10", event.player, event.world, true, true);
                        event.player.update({clickedNetherObelisk: true});
                    }

                }
                
            }
        

        if(!isNull(itemStack1)){ 

            // Dreadstone Tablet
            if (tablet.matches(itemStack1)) {  
                if(event.target.definition.name == "PigZombie"){
                    event.player.sendChat("§o§cAs you raise the Dreadstone Tablet to the Dreadswine, it shatters in your hands, releasing a surge of dark energy. You notice faint tear trace down the Dreadswine's face as the fragments of the tablet disintegrate into dust.");
                    Commands.call("playsound enderskills:syphon player @p ~ ~ ~ 100 0.6", event.player, event.world, true, true);
                    Commands.call("sanity remove " + event.player.name + " 5", event.player, event.world, true, true);
                    Commands.call("effect @p wither 5", event.player, event.world, true, true);
                    itemStack1.mutable().shrink(1);
                }
            }

            // Dreadstone Fragment
            if (dreadstone_fragment.matches(itemStack1)) {  
                if(event.target.definition.name == "PigZombie"){
                    if(isNull(event.player.data.dreadstoneFragmentClick) || event.player.data.dreadstoneFragmentClick == false){
                        itemStack1.mutable().shrink(1);
                        event.player.sendChat("§o§cYou carefully hand a fragment of the Dreadstone Tablet to the Dreadswine. It grasps the piece with trembling hands, staring at it intensely before carrying on.");
                        Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.world, true, true);
                        event.player.update({dreadstoneFragmentClick: true});
                    }
                    // really stupid work around for interact event triggering twice (only for the fragment?)
                    event.player.world.catenation()
                    .run(function(world, context) {
                        context.data = world.time;
                    })
                    .sleep(10)
                    .then(function(world, context) {
                        event.player.update({testing: null});
                    })
                    .start();
                    
                }
            }
        }
    }
});



static riftbreaker as IItemStack = <contenttweaker:riftbreaker_crystal>;
static traceofdeath as IItemStack = <enderskills:token>;
static scepter as IItemStack = <contenttweaker:infernal_fortress_scepter>;

events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){

        // Riftbreaker Crystal
        // Summons a structure when right clicked, gives player launch effect
        val itemStack1 = event.item as IItemStack; 
        if(!isNull(itemStack1)){
            if (riftbreaker.matches(itemStack1)) {  

                if(event.player.dimension == -1){
                    Commands.call("playsound minecraft:item.totem.use player @p", event.player, event.world, true, true);
                    Commands.call("playsound dsurround:wind player @p", event.player, event.world, true, true);
                    Commands.call("pillar-spawn deletebarrier ~ 3 ~", event.player, event.world, true, true);
                    Commands.call("effect @a potioncore:launch 300", event.player, event.world, true, true);
                    itemStack1.mutable().shrink(1);
                }
                else
                    event.player.sendChat("§9Only useable in the Nether");
                    Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.world, true, true);
            }
        }


        // Trace of Death first time right-clicking
        val itemStack2 = event.item as IItemStack; 
        if(!isNull(itemStack2)){
            if (traceofdeath.matches(itemStack2)) {  

                if(isNull(event.player.data.shatteredTraceOfDeath) || event.player.data.shatteredTraceOfDeath == false){
                    event.player.sendChat("§o§cAs the final pieces of the Trace of Death crumble at your feet, you are suddenly consumed by a rush of spectral energies. The secrets you now possess are both a blessing and a curse, for the shadows that surround you have been stirred, and you cannot escape the feeling that you are being watched by something far beyond your comprehension.");
                    Commands.call("playsound cyclicmagic:chaos_reaper master @p ~ ~ ~ 0.6 0.7", event.player, event.world, true, true);

                    // Replace mod behavior with our own behavior due to weirdness when granting soul levels
                    Commands.call("playsound minecraft:entity.splash_potion.break master @p ~ ~ ~ 1.0 0.7", event.player, event.world, true, true);
                    server.commandManager.executeCommand(server, "es_advancement @p level set 1");
                    itemStack2.mutable().shrink(1);
                    event.cancel();

                    event.player.update({shatteredTraceOfDeath: true});
                    
                    event.player.world.catenation()
                    .run(function(world, context) {
                        context.data = world.time;
                    })
                    .sleep(300)
                    .then(function(world, context) {
                        event.player.sendChat("§o§cMemories that don't seem to be your own begin to flood your mind. You quickly bring out your notebook to write it down.");
                        Commands.call("advancement grant @p only triumph:advancements/journal_entries/trace_of_death_entry", event.player, event.world, true, true);

                    })
                    .start();
                }
                Commands.call("effect @p minecraft:nausea 10", event.player, event.world, true, true);
            }
        }



        // Scepter of Infernal Conjuring
        // Summons a structure when right clicked
        val itemStack3 = event.item as IItemStack; 
        if(!isNull(itemStack3)){
            if (scepter.matches(itemStack3)) {  
                Commands.call("playsound minecraft:item.totem.use player @p", event.player, event.world, true, true);
                event.player.sendChat("§o§cThe ground begins to tremble as you tightly grasp the scepter. As the air crackles with anticipation, the scepter dissolves into a swirling vortex of crimson smoke. In the blink of an eye, the smoke weaves itself into the fabric of space as the scepter's essence becomes one with a hellish structure.");
                Commands.call("pillar-spawn witherarena ~ 9 ~", event.player, event.world, true, true);

                Commands.call("tp @a ~ 10 ~", event.player, event.world, true, true);
                Commands.call("playsound enderskills:portal_active player @p", event.player, event.world, true, true);
                itemStack3.mutable().shrink(1);
                Commands.call("setworldspawn ~ ~ ~", event.player, event.world, true, true);
                Commands.call("spawnpoint @a ~ ~ ~", event.player, event.world, true, true);
                Commands.call("kill @e[type=nethercraft:dark_zombie]", event.player, event.world, true, true);
                Commands.call("kill @e[type=nethercraft:camouflage_spider]", event.player, event.world, true, true);
                Commands.call("kill @e[type=nethercraft:bloody_zombie]", event.player, event.world, true, true);
                Commands.call("kill @e[type=primitivemobs:blazing_juggernaut]", event.player, event.world, true, true);
                Commands.call("kill @e[type=primitivemobs:festive_creeper]", event.player, event.world, true, true);
                Commands.call("kill @e[type=primitivemobs:flame_spewer]", event.player, event.world, true, true);
                Commands.call("kill @e[type=quark:foxhound]", event.player, event.world, true, true);
                Commands.call("kill @e[type=minecraft:zombie_pigman]", event.player, event.world, true, true);
                Commands.call("kill @e[type=minecraft:blaze]", event.player, event.world, true, true);
                Commands.call("kill @e[type=minecraft:wither_skeleton]", event.player, event.world, true, true);
                Commands.call("kill @e[type=minecraft:ghast]", event.player, event.world, true, true);
                Commands.call("kill @e[type=item]", event.player, event.world, true, true);
                event.player.sendChat("§9Your soul has been bound to this position.");
                
            }
        }
    }
});


