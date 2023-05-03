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
import mods.contenttweaker.Commands;
import mods.contenttweaker.ActionResult;



static scepter as IItemStack = <contenttweaker:infernal_fortress_scepter>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack; 
        if ((itemStack.definition.id).matches(scepter.definition.id)) {  
            Commands.call("playsound minecraft:item.totem.use player @p", event.player, event.world, true, true);
            server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"The ground begins to tremble as you tightly grasp the scepter, its dark energy pulsating through your veins. As the air crackles with anticipation, the scepter starts to dissolve into a swirling vortex of crimson smoke. Gradually, the smoke weaves itself into the fabric of the surroundings as the scepter's essence becomes one with a hellish structure.\",\"color\":\"dark_red\",\"italic\":true}]");
            Commands.call("pillar-spawn witherarena ~ 10 ~", event.player, event.world, true, true);
            Commands.call("playsound enderskills:portal_active player @p", event.player, event.world, true, true);
            var i = 0;
            while(i < 100){
                i+=1;
            }
            if(i == 100){
                Commands.call("tp @a ~ 10 ~", event.player, event.world, true, true);
            }
            //Commands.call("clear @p contenttweaker:infernal_fortress_scepter", event.player, event.world, true, true);
        }
    }
});


static traceofdeath as IItemStack = <enderskills:token>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack; 
        if ((itemStack.definition.id).matches(traceofdeath.definition.id)) {  

            if(isNull(event.player.data.shatteredTraceOfDeath)){
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"As the final pieces of the Trace of Death crumble at your feet, you are suddenly consumed by a rush of spectral energies. The secrets you now possess are both a blessing and a curse, for the shadows that surround you have been stirred, and you cannot escape the feeling that you are being watched by something far beyond your comprehension.\",\"color\":\"dark_red\",\"italic\":true}]");
                Commands.call("playsound cyclicmagic:chaos_reaper master @p ~ ~ ~ 0.6 0.7", event.player, event.world, true, true);
                event.player.update({shatteredTraceOfDeath: true});
            }
        }
    }
});
