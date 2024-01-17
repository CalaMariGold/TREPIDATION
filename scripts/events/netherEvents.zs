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


static veilstriumPick as IItemStack = <nethercraft:neridium_pickaxe:*>;
static netherrackPick as IItemStack = <nethercraft:netherrack_pickaxe:*>;


events.onPlayerLeftClickBlock(function(event as crafttweaker.event.PlayerLeftClickBlockEvent){
    if(!event.entity.world.isRemote()){
        if(isNull(event.player.data.clickedNetherBarrier)){       
            val playerHoldItemStack = event.player.currentItem as IItemStack; 
            if(event.block.displayName == "Barrier §4Alpha"){
                if(!isNull(playerHoldItemStack)){
                    if (veilstriumPick.matches(playerHoldItemStack) || netherrackPick.matches(playerHoldItemStack)) {  
                        event.player.sendChat("§4As you strike the barrier above you, a haunting realization dawns: A tool much stronger than your " + event.player.currentItem.displayName + " will be required to shatter this engimatic veil - one steeped in the essence of Withering, forged by a dark, concealed entity...");
                        Commands.call("playsound quark:item.soul_bead.curse player @s ~ ~ ~ 5.0 1.0 1.0", event.player, event.world, true, true);
                    }
                }
                event.player.update({clickedNetherBarrier: true});
            }
        }
    }
});

events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if(!event.entity.world.isRemote()){
        if(event.entity.definition.id == <entity:minecraft:wither>.id)
        {
    
            server.commandManager.executeCommand(server, "gamestage silentadd @a killedWither");

            EventManager.getInstance().onTimerTick(function(event as TickEvent){
                if(event.player.hasGameStage("nether") && event.player.hasGameStage("killedWither")){

                    var player_name = event.player.name;
                    var totalSecs = event.tick/20;
                    var minutes = (totalSecs % 3600) / 60;
                    var seconds = totalSecs % 60;

                    var totalSecondsElasped = 3600 - totalSecs;
                    var secondsElasped = totalSecondsElasped % 60;
                    var minutesElasped = (totalSecondsElasped % 3600) / 60;
                    event.player.sendChat(player_name + " killed The Wither with §4" + minutes + ":" + seconds + " §fleft (" + minutesElasped + ":" + secondsElasped + " elasped)." );
                    server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Timer Bonuses Used: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"timerbonus\"},\"color\":\"dark_red\"}]");
                    server.commandManager.executeCommand(server, "effect @a fire_resistance 120");
                    server.commandManager.executeCommand(server, "effect @a regeneration 120");
                    server.commandManager.executeCommand(server, "effect @a invisibility 120");
                    server.commandManager.executeCommand(server, "effect @a potioncore:slow_fall 120");
                    server.commandManager.executeCommand(server, "effect @a minecraft:glowing 120");
                    event.player.sendChat("§6A mysterious yet benevolent aura surrounds you, for now...");

                    server.commandManager.executeCommand(server, "give @a timeisup:timer_bonus 3");
                    server.commandManager.executeCommand(server, "give @a enderskills:book 1");
                    server.commandManager.executeCommand(server, "give @a enderskills:token 3");
                    server.commandManager.executeCommand(server, "give @a contenttweaker:riftbreaker_crystal 1");
                    server.commandManager.executeCommand(server, "give @a nethercraft:pyridium_pickaxe 1");

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

                    server.commandManager.executeCommand(server, "gamestage silentremove @a nether");
                }
        });
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
                    server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Only useable in the Nether\",\"color\":\"dark_red\",\"italic\":false}]");
            }
        }


        // Trace of Death first time right-clicking
        val itemStack2 = event.item as IItemStack; 
        if(!isNull(itemStack2)){
            if (traceofdeath.matches(itemStack2)) {  

                if(isNull(event.player.data.shatteredTraceOfDeath)){
                    server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"As the final pieces of the Trace of Death crumble at your feet, you are suddenly consumed by a rush of spectral energies. The secrets you now possess are both a blessing and a curse, for the shadows that surround you have been stirred, and you cannot escape the feeling that you are being watched by something far beyond your comprehension.\",\"color\":\"dark_red\",\"italic\":true}]");
                    Commands.call("playsound cyclicmagic:chaos_reaper master @p ~ ~ ~ 0.6 0.7", event.player, event.world, true, true);
                    event.player.update({shatteredTraceOfDeath: true});
                }
            }
        }



        // Scepter of Infernal Conjuring
        // Summons a structure when right clicked
        val itemStack3 = event.item as IItemStack; 
        if(!isNull(itemStack3)){
            if (scepter.matches(itemStack3)) {  
                Commands.call("playsound minecraft:item.totem.use player @p", event.player, event.world, true, true);
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"The ground begins to tremble as you tightly grasp the scepter. As the air crackles with anticipation, the scepter dissolves into a swirling vortex of crimson smoke. In the blink of an eye, the smoke weaves itself into the fabric of space as the scepter's essence becomes one with a hellish structure.\",\"color\":\"dark_red\",\"italic\":true}]");
                Commands.call("pillar-spawn witherarena ~ 9 ~", event.player, event.world, true, true);
                var i = 0;
                while(i < 1000){
                    i+=1;
                }
                if(i == 1000){
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
                    server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your soul has been bound to this position.\",\"color\":\"dark_red\",\"italic\":true}]");
                }
            }
        }
        
    }
});


