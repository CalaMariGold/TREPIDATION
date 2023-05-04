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
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.world.IBlockPos;
import mods.contenttweaker.Commands;


// Surface to End
events.onEntityLivingUpdate(function(event as crafttweaker.event.EntityLivingUpdateEvent) {
    if(!event.entity.world.isRemote()){
        if (event.entityLivingBase instanceof IPlayer) {
            var player as IPlayer = event.entityLivingBase;
            
            if(player.dimension == 0){
                if(player.y >= 256){
                    player.update({playerX: player.position.x as IData});
                    player.update({playerZ: player.position.z as IData});
                    player.dimension = 1;
                }
            }

            if(player.dimension == 1){
                if(player.y <= 8){
                    player.dimension = 0;
                    server.commandManager.executeCommand(server, "tp " + player.name + " " + player.data.playerX as float + " " + 240 + " " + player.data.playerZ as float);
                }
            }

        }
    }
});

