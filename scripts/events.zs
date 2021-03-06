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


// Create a scoreboard for timer bonuses used when the player first logs into the game
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent) {
	if (isNull(event.player.data.firstTimeJoin)) {
        server.commandManager.executeCommand(server, "scoreboard objectives add timerbonus1 dummy");

        server.commandManager.executeCommand(server, "scoreboard objectives add timerbonus2 dummy");
        server.commandManager.executeCommand(server, "scoreboard players set Fake_Player timerbonus2 2");

        server.commandManager.executeCommand(server, "scoreboard objectives add newtimer dummy");


        event.player.update({firstTimeJoin: true});
    }
});


// Output some neccessary speedrun information in chat when escaping a dimension for the first time
events.onPlayerChangedDimension(function(event as crafttweaker.event.PlayerChangedDimensionEvent){

    // Nether to Erebus
    if((event.from == -1 && event.to == 5)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("nether") && event.player.hasGameStage("erebus")){

                server.commandManager.executeCommand(server, "scoreboard players operation @p newtimer = @p timerbonus1");
                server.commandManager.executeCommand(server, "scoreboard players operation @p newtimer /= Fake_Player timerbonus2");

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat(player_name + " escaped the Nether with " + "??4" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " ??fleft." );
                server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Times used timer bonus: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"newtimer\"},\"color\":\"dark_red\"}]");
                
                server.commandManager.executeCommand(event.player, "seed");
                server.commandManager.executeCommand(server, "gamestage silentremove @p nether");
            }
        });
    }

    // Erebus to Deep Dark
    if((event.from == 5 && event.to == 10)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("erebus") && event.player.hasGameStage("deepdark")){
                server.commandManager.executeCommand(server, "scoreboard players operation @p newtimer = @p timerbonus1");
                server.commandManager.executeCommand(server, "scoreboard players operation @p newtimer /= Fake_Player timerbonus2");

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat(player_name + " escaped the Erebus with " + "??4" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " ??fleft." );
                server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Times used timer bonus: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"newtimer\"},\"color\":\"dark_red\"}]");

                server.commandManager.executeCommand(event.player, "seed");
                server.commandManager.executeCommand(server, "gamestage silentremove @p erebus");
            }
        });
    }

    // Deep Dark to Surface
    if((event.from == 10 && event.to == 0)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("deepdark") && event.player.hasGameStage("surface")){
                server.commandManager.executeCommand(server, "scoreboard players operation @p newtimer = @p timerbonus1");
                server.commandManager.executeCommand(server, "scoreboard players operation @p newtimer /= Fake_Player timerbonus2");

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat(player_name + " escaped the Deep Dark with " + "??4" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " ??fleft." );
                server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Times used timer bonus: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"newtimer\"},\"color\":\"dark_red\"}]");
                
                server.commandManager.executeCommand(event.player, "seed");
                server.commandManager.executeCommand(event.player, "say Developer Note: It's currently not possible to enter the End. Until then, have fun exploring the surface.");
                server.commandManager.executeCommand(server, "gamestage silentremove @p deepdark");
            }
        });
    }
});

// Change player to spectator after dying when time is up
// On time is up
EventManager.getInstance().onTimeIsUp(function(event as TimeIsUpEvent){
    // On entity death
    events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent){
        // If event entity is a player
        if (event.entity instanceof IPlayer) {
            events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent){
                server.commandManager.executeCommand(server, "gamemode 3 @p");
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your effort is meaningless. Welcome to the afterlife.\",\"color\":\"dark_red\",\"italic\":false}]");
            });
        }
    });
});


// Add to the timer bonuses used scoreboard counter when right clicking a timer bonuses
// NOTE, onPlayerRightClickItem IS CURRENTLY RUNNING TWICE PER CLICK
static timerBonus as IItemStack = <timeisup:timer_bonus>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    val itemStack = event.item as IItemStack;     
    if ((itemStack.definition.id).matches(timerBonus.definition.id)) {  
        server.commandManager.executeCommand(server, "scoreboard players add @p timerbonus1 1");
    }  
});
