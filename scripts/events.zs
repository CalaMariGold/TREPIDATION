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

events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent) {
	if (isNull(event.player.data.firstTimeJoin)) {
        server.commandManager.executeCommand(server, "scoreboard objectives add UsedTimerBonus dummy");
        event.player.update({firstTimeJoin: true});
    }
});

events.onPlayerChangedDimension(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
    if((event.from == -1 && event.to == 5)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("nether")){
                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat(player_name + " escaped the Nether with " + "§4" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " §fleft." );
                server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Times used timer bonus: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"UsedTimerBonus\"},\"color\":\"dark_red\"}]");
                server.commandManager.executeCommand(event.player, "seed");
                server.commandManager.executeCommand(server, "gamestage silentremove @p nether");
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


static timerBonus as IItemStack = <timeisup:timer_bonus>;

events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    val itemStack = event.item as IItemStack;     
    if ((itemStack.definition.id).matches(timerBonus.definition.id)) {  
        server.commandManager.executeCommand(server, "scoreboard players add @p UsedTimerBonus 1");
        server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Times used timer bonus: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"UsedTimerBonus\"},\"color\":\"dark_red\"}]"); 
    }  
});
