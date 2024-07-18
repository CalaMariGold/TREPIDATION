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

static dreadswine_entry as IItemStack = <contenttweaker:dreadswine_entry>;
static foulite_dust_entry as IItemStack = <contenttweaker:foulite_dust_entry>;

events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack1 = event.item as IItemStack; 

        // Entry #7 - Dreadswine
        if(!isNull(itemStack1)){
            if (dreadswine_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/dreadswine_entry", event.player, event.world, true, true);
                //Commands.call("playsound [PAPER SOUND EFFECT] player @p", event.player, event.world, true, true);
                itemStack1.mutable().shrink(1);
            }

            // Entry #9 - Foulite Dust
            if (foulite_dust_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/foulite_dust_entry", event.player, event.world, true, true);
                //Commands.call("playsound [PAPER SOUND EFFECT] player @p", event.player, event.world, true, true);
                itemStack1.mutable().shrink(1);
            }
        }
    }
});


