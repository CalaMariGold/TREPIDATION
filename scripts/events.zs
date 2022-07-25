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

//Add player name when achievement obtained
/*
events.onPlayerAdvancement(function(event as crafttweaker.event.PlayerAdvancement){
    var achievementPlayer = [event.player.name];
    print("Player" + achievementPlayer + "obtained an achievement.");
});

EventManager.getInstance().onTimerTick(function(event as TickEvent){
    var player_name = event.player.name;
    if(achievementPlayer has player_name) {
        var seconds = event.tick/20;
        event.player.sendChat("Time left for " + player_name + ": " + seconds);
        //achievement.remove(player_name);
     }
});*/




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