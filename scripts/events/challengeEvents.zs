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


global tick as int[] = [0] as int[];
EventManager.getInstance().onTimerTick(function(event as TickEvent){
    tick[0] = event.tick as int;
});

// Die in the first 30 seconds of starting a run 
events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if(!event.entity.world.isRemote()){
        if (event.entity instanceof IPlayer)
        {
            var player1 as IPlayer = event.entity;
            var totalSecs = tick[0]/20 as int;
            var totalSecondsElasped = 3600 - totalSecs;
            
            if(totalSecondsElasped <= 30 && isNull(player1.data.died)){
                server.commandManager.executeCommand(server, "advancement grant " + player1.name + " only triumph:advancements/challenges/die");
                player1.updateNBT({died: true});
            }
        }
    }
});