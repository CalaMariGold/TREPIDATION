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


events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if(!event.entity.world.isRemote()){
        if(event.entity.definition.id == <entity:minecraft:wither>.id)
        {
            server.commandManager.executeCommand(server, "give @a timeisup:timer_bonus 3");
            server.commandManager.executeCommand(server, "gamestage add @a killedWither");


            EventManager.getInstance().onTimerTick(function(event as TickEvent){
                if(event.player.hasGameStage("nether") && event.player.hasGameStage("killedWither")){

                    var player_name = event.player.name;
                    var totalSecs = event.tick/20;
                    var minutes = (totalSecs % 3600) / 60;
                    var seconds = totalSecs % 60;

                    var totalSecondsElasped = 3600 - totalSecs;
                    var secondsElasped = totalSecondsElasped % 60;
                    var minutesElasped = (totalSecondsElasped % 3600) / 60;
                    event.player.sendChat(player_name + " killed The Wither in §4" + minutesElasped + ":" + secondsElasped + ". (" + minutes + ":" + seconds + " §fleft)" );
                    server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Timer Bonuses Used: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"timerbonus\"},\"color\":\"dark_red\"}]");
                    
                    server.commandManager.executeCommand(server, "gamestage silentremove @p nether");
                }
        });
        }
    }
});

// Riftbreaker Crystal
// Summons a structure when right clicked, gives player launch effect
static riftbreaker as IItemStack = <contenttweaker:riftbreaker_crystal>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack; 
        if ((itemStack.definition.id).matches(riftbreaker.definition.id)) {  
            if(event.player.dimension == -1){
                Commands.call("playsound minecraft:item.totem.use player @p", event.player, event.world, true, true);
                Commands.call("playsound dsurround:wind player @p", event.player, event.world, true, true);
                Commands.call("pillar-spawn deletebarrier ~ 3 ~", event.player, event.world, true, true);
                Commands.call("effect @a potioncore:launch 200", event.player, event.world, true, true);
                // Below causes a nullpointer exception, but doesn't break anything. ChatFlow is used to remove the error log in the chat
                Commands.call("clear @p contenttweaker:riftbreaker_crystal", event.player, event.world, true, true);
            }
            else
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Only useable in the Nether\",\"color\":\"dark_red\",\"italic\":false}]");
        }
        
    }
});


// Scepter of Infernal Conjuring
// Summons a structure when right clicked
static scepter as IItemStack = <contenttweaker:infernal_fortress_scepter>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack; 
        if ((itemStack.definition.id).matches(scepter.definition.id)) {  
            Commands.call("playsound minecraft:item.totem.use player @p", event.player, event.world, true, true);
            server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"The ground begins to tremble as you tightly grasp the scepter. As the air crackles with anticipation, the scepter starts to dissolve into a swirling vortex of crimson smoke. In the blink of an eye, the smoke weaves itself into the fabric of the surroundings as the scepter's essence becomes one with a hellish structure.\",\"color\":\"dark_red\",\"italic\":true}]");
            Commands.call("pillar-spawn witherarena ~ 9 ~", event.player, event.world, true, true);
            var i = 0;
            while(i < 1000){
                i+=1;
            }
            if(i == 1000){
                Commands.call("tp @a ~ 10 ~", event.player, event.world, true, true);
                Commands.call("playsound enderskills:portal_active player @p", event.player, event.world, true, true);
                // Below causes a nullpointer exception, but doesn't break anything. ChatFlow is used to remove the error log in the chat
                Commands.call("clear @p contenttweaker:infernal_fortress_scepter", event.player, event.world, true, true);
            }
        }
    }
});


// Trace of Death first time right-clicking
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
