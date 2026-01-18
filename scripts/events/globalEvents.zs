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
import crafttweaker.event.EntityLivingDeathEvent;
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
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeModifier;
import mods.contenttweaker.Commands;
import crafttweaker.event.CommandEvent;
import crafttweaker.event.PlayerCloneEvent;


// Player data gets reset on death
// This clones it to the new player
events.onPlayerClone(function(event as crafttweaker.event.PlayerCloneEvent){
    if(!event.entity.world.isRemote()){

        event.player.update({firstTimeJoin: event.originalPlayer.data.firstTimeJoin});
        event.player.update({failedRuns: event.originalPlayer.data.failedRuns});
        event.player.update({timerbonus: event.originalPlayer.data.timerbonus});
        event.player.update({usedChronoAbsolution: event.originalPlayer.data.usedChronoAbsolution});
        event.player.update({clickedNetherObelisk: event.originalPlayer.data.clickedNetherObelisk});
        event.player.update({clickedNetherBarrier: event.originalPlayer.data.clickedNetherBarrier});
        event.player.update({shatteredTraceOfDeath: event.originalPlayer.data.shatteredTraceOfDeath});
        event.player.update({clickedEchoOfBetrayal: event.originalPlayer.data.clickedEchoOfBetrayal});
        event.player.update({dreadstoneFragmentClick: event.originalPlayer.data.dreadstoneFragmentClick});
    }
});


// Do things when the player first logs into the game
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent) {
	if (isNull(event.player.data.firstTimeJoin)) {

        // Create player data to avoid nullpointer exceptions
        if(!isNull(event.player)){
            event.player.update({timerbonus: 0 as int});
            event.player.update({failedRuns: 0 as int});
            event.player.update({usedChronoAbsolution: false as bool});
            event.player.update({clickedNetherObelisk: false as bool});
            event.player.update({clickedNetherBarrier: false as bool});
            event.player.update({clickedEchoOfBetrayal: false as bool});
            event.player.update({shatteredTraceOfDeath: false as bool});
            event.player.update({dreadstoneFragmentClick: false as bool});
        } else {
            server.commandManager.executeCommand(server, "say Error: Player not found, please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
        }

        // Run neccessary starting commands
        server.commandManager.executeCommand(server, "op " + event.player.name);
        Commands.call("advancement grant @p only triumph:advancements/dimensions/start", event.player, event.entity.world, true, true);

        // Set souls to 0 instead of 1. Because of this, we have to manually add soul levels on right click
        Commands.call("es_advancement @p level set 0", event.player, event.entity.world, true, true);

        // Resistance on first time join only
        Commands.call("effect @p resistance 15 255", event.player, event.entity.world, true, true);

        // For some reason, journal entries only unlock after an achievement is granted a few seconds after world start
        event.player.world.catenation()
        .run(function(world, context) {
            context.data = world.time;
        })
        .sleep(200)
        .then(function(world, context) {
            Commands.call("advancement grant @p only triumph:advancements/hidden/unlock_journal", event.player, event.entity.world, true, true);
            event.player.sendChat("§c§oDisoriented, you awaken to find a §e§ojournal§c§o attached to your belt. As you begin to write, you notice a scar on your left wrist.");
            Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.entity.world, true, true);
        })
        .start();
        
        event.player.update({firstTimeJoin: true});
    }
});


// Give player soul compass with curse of vanishing upon death
events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent){
    if(!event.entity.world.isRemote()){
        event.player.give(<quark:soul_compass>.withTag({ench:[{id:71,lvl:1}]}));

        Commands.call("effect @p resistance 5", event.player, event.entity.world, true, true);
    }
});


// Heart Dust Healing
static heart_dust as IItemStack = <scalinghealth:heartdust>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemstack = event.item as IItemStack; 
        if(!isNull(itemstack)){
            if (heart_dust.matches(itemstack)) {  

                Commands.call("playsound enderskills:heal_self master @p ~ ~ ~ 0.5 1.7", event.player, event.world, true, true);
                event.player.health = event.player.health + 1;  
                itemstack.mutable().shrink(1);
            }
        }
    }
});


// Soul Anchor: sets spawn
static soul_anchor as IItemStack = <contenttweaker:soul_anchor>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemstack = event.item as IItemStack; 
        if(!isNull(itemstack)){
            if (soul_anchor.matches(itemstack)) {  
                if (event.player.dimension == -1) {
                    event.player.sendChat("§9Can not be used in the Nether.");
                    Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.world, true, true);
                }
                else {
                    event.player.sendChat("§4Your soul has been bound to this position. Be sure not to obstruct this area.");
                    Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.world, true, true);
                    Commands.call("setworldspawn ~ ~ ~", event.player, event.world, true, true);
                    Commands.call("spawnpoint @p ~ ~ ~", event.player, event.world, true, true);
                    itemstack.mutable().shrink(1);
                }
            }
        }
    }
});



// Prevent players falling back down into the prev dim when respawning
events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent){
    if(!event.entity.world.isRemote()){
        if(event.player.dimension != -1){
            Commands.call("setblock ~ 0 ~ dimstack:portal", event.player, event.entity.world, true, true);
        }
    }
});

// Output some neccessary speedrun information in chat when escaping a dimension for the first time
events.onPlayerChangedDimension(function(event as crafttweaker.event.PlayerChangedDimensionEvent){

    // Nether to Erebus
    if((event.from == -1 && event.to == 5)){
        Commands.call("setblock ~ 0 ~ dimstack:portal", event.player, event.entity.world, true, true);
        Commands.call("effect @p clear", event.player, event.entity.world, true, true);

        // sleep 100 ticks to ensure the player gets erebus gamestage
        event.player.world.catenation()
        .run(function(world, context) {
            context.data = world.time;
        })
        .sleep(100)
        .then(function(world, context) {
            if(event.player.hasGameStage("killedWither") && event.player.hasGameStage("erebus")){
                Commands.call("sanity add " + event.player.name + " 100", event.player, event.player.world, true, true);
                event.player.sendChat("§3§oYour grip on reality strengthens...");
                server.commandManager.executeCommand(server, "gamestage silentremove @a killedWither");
            }   
        })
        .start();
        
    }

    // Erebus to The Mind's Abyss
    if((event.from == 5 && event.to == 10)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("erebus") && event.player.hasGameStage("minds_abyss")){

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;
                var timerBonusCount = event.player.data.timerbonus as int;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat("§a" + player_name + " escaped the Erebus with " + "§c" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " §aleft." );
                if(timerBonusCount > 0){
                    event.player.sendChat("§aTimer Bonuses Used: §4" + timerBonusCount);
                }
                Commands.call("sanity add " + event.player.name + " 100", event.player, event.player.world, true, true);
                event.player.sendChat("§3§oYour grip on reality strengthens...");

                // Give player torch in-case they don't have one
                Commands.call("give @p minecraft:torch", event.player, event.player.world, true, true);

                server.commandManager.executeCommand(server, "gamestage silentremove @p erebus");
            }
        });

        // Sanity warning when entering Mind's Abyss
        event.player.world.catenation()
            .run(function(world, context) {
                context.data = world.time;
            })
            .sleep(500)
            .then(function(world, context) {
                event.player.sendChat("§c§oYou feel a bone-deep chill settle behind your eyes; a dreadful feeling that grows with §e§oeach passing moment§c§o in this realm. You feel a pull towards a §e§oparticular gem§c§o that might calm your mind, harbored in stone or held by a forgotten presence.");
                Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.player.world, true, true);
            })
            .start();
    }

    // The Mind's Abyss to Surface
    if((event.from == 10 && event.to == 0)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("minds_abyss") && event.player.hasGameStage("surface")){

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;
                var timerBonusCount = event.player.data.timerbonus as int;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat("§a" + player_name + " escaped The Mind's Abyss with " + "§c" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " §aleft." );
                if(timerBonusCount > 0){
                    event.player.sendChat("§aTimer Bonuses Used: §4" + timerBonusCount);
                }
                Commands.call("sanity add " + event.player.name + " 25", event.player, event.player.world, true, true);
                event.player.sendChat("§3§oYour grip on reality strengthens...");
                server.commandManager.executeCommand(server, "gamestage silentremove @p minds_abyss");
                

                event.player.sendChat("§3Developer Note: It's currently not possible to enter the End and beat the modpack. Until then, have fun exploring the Surface...");
                Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.world, true, true);
            }
        });
    }

    // Failed run, send to Limbo
    if(event.to == 684){
    
        Commands.call("clear @p", event.player, event.entity.world, true, true);
        Commands.call("baubles clear @p", event.player, event.entity.world, true, true);
        Commands.call("give @p minecraft:torch", event.player, event.entity.world, true, true);
        Commands.call("title @p times 40 120 60", event.player, event.entity.world, true, true);
        Commands.call("title @p subtitle {\"text\":\"There is no escape\", \"color\":\"gray\"}", event.player, event.entity.world, true, true);
        Commands.call("title @p title {\"text\":\"§kLimbo\", \"bold\":false, \"italic\":false, \"color\":\"white\"}", event.player, event.entity.world, true, true);



        if(!isNull(event.player.data.failedRuns)){
            if(!isNull(event.player)){
                event.player.update({failedRuns: event.player.data.failedRuns + 1 as int});
            } else {
                server.commandManager.executeCommand(server, "say Error: Player not found, please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
            }
        } else {
            server.commandManager.executeCommand(server, "say Error: failedRuns data not found. Please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
        }


        // visitor in limbo
        event.player.world.catenation()
        .run(function(world, context) {
            context.data = world.time;
        })
        .sleep(500)
        .then(function(world, context) {
            if(event.player.dimension == 684){
                Commands.call("summon wyrmsofnyrus:thevisitor ~ ~+100 ~", event.player, event.entity.world, true, true);
                Commands.call("playsound wyrmsofnyrus:visitormessage master @p ~ ~ ~ 10.0 0.5", event.player, event.entity.world, true, true);
            }
        })
        .start();



        
    }

    // Easter egg for trying to escape Limbo
    if((event.from == 684 && event.to == 1) || (event.from == 684 && event.to == 0)){
        server.commandManager.executeCommand(server, "tpp " + event.player.name + " 684 100 500 100");
        event.player.sendChat("§4YOUR EFFORT IS MEANINGLESS. THERE IS NO ESCAPE.");

        // dont count this as a failed run
        if(!isNull(event.player.data.failedRuns)){
            if(!isNull(event.player)){
                event.player.update({failedRuns: event.player.data.failedRuns - 1 as int});
            } else {
                server.commandManager.executeCommand(server, "say Error: Player not found, please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
            }
        } else {
            server.commandManager.executeCommand(server, "say Error: failedRuns data not found. Please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
        }
    }
});

events.onEntityLivingUpdate(function(event as crafttweaker.event.EntityLivingUpdateEvent) {
    if(!event.entity.world.isRemote()){
        if (event.entityLivingBase instanceof IPlayer) {
            var player as IPlayer = event.entityLivingBase;
            
            if(player.dimension == 684){
                server.commandManager.executeCommand(server, "sanity set @p 20");
                // Only apply effects every 20 ticks (1 second)
                if (player.world.time % 20 == 0) {
                    server.commandManager.executeCommand(server, "effect @p minecraft:resistance 99999 255");
                    server.commandManager.executeCommand(server, "effect @p minecraft:wither 99999 0");
                    server.commandManager.executeCommand(server, "effect @p minecraft:slowness 99999 1");
                    server.commandManager.executeCommand(server, "effect @p srparasites:fear 99999 0");
                    server.commandManager.executeCommand(server, "effect @p elenaidodge2:weight 99999 0");
                    server.commandManager.executeCommand(server, "hunger @p 20");
                    player.health = player.health + 1;
                }
            }
        }
    }
});