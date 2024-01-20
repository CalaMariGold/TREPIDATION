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



// Soul Anchor: sets spawn
static soul_anchor as IItemStack = <contenttweaker:soul_anchor>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemstack = event.item as IItemStack; 
        if(!isNull(itemstack)){
            if (soul_anchor.matches(itemstack)) {  
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your soul has been bound to this position. Be sure not to obstruct this area.\",\"color\":\"dark_red\",\"italic\":true}]");
                Commands.call("setworldspawn ~ ~ ~", event.player, event.world, true, true);
                Commands.call("spawnpoint @p ~ ~ ~", event.player, event.world, true, true);
                itemstack.mutable().shrink(1);
            }
        }
    }
});


//val uuid = "84f27e8d-85d7-45f4-9b59-b2f5c19da11d";
//val attribute_modifier = AttributeModifier.createModifier("prepspeed", 5.0, 2, uuid);

// Give player soul compass with curse of vanishing upon death
events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent){
    if(!event.entity.world.isRemote()){
        //val attribute = event.player.getAttribute("battlecorrection.preparationSpeed");
        //attribute.applyModifier(attribute_modifier);

        event.player.give(<quark:soul_compass>.withTag({ench:[{id:71,lvl:1}]}));
    }
});

// Create a scoreboard for timer bonuses used when the player first logs into the game
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent) {
	if (isNull(event.player.data.firstTimeJoin)) {
        server.commandManager.executeCommand(server, "scoreboard objectives add timerbonus dummy");
        event.player.update({firstTimeJoin: true});
    }
});


// Output some neccessary speedrun information in chat when escaping a dimension for the first time
events.onPlayerChangedDimension(function(event as crafttweaker.event.PlayerChangedDimensionEvent){

    // Erebus to Deep Dark
    if((event.from == 5 && event.to == 10)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("erebus") && event.player.hasGameStage("deepdark")){

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat(player_name + " escaped the Erebus with " + "§4" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " §fleft." );
                server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Timer Bonuses Used: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"timerbonus\"},\"color\":\"dark_red\"}]");

                server.commandManager.executeCommand(server, "gamestage silentremove @p erebus");
            }
        });
    }

    // Deep Dark to Surface
    if((event.from == 10 && event.to == 0)){
        EventManager.getInstance().onTimerTick(function(event as TickEvent){

            if(event.player.hasGameStage("deepdark") && event.player.hasGameStage("surface")){

                var player_name = event.player.name;
                var totalSecs = event.tick/20;
                var minutes = (totalSecs % 3600) / 60;
                var seconds = totalSecs % 60;

                var totalSecondsElasped = 3600 - totalSecs;
                var secondsElasped = totalSecondsElasped % 60;
                var minutesElasped = (totalSecondsElasped % 3600) / 60;
                event.player.sendChat(player_name + " escaped the Deep Dark with " + "§4" + minutes + ":" + seconds + " (" + minutesElasped + ":" + secondsElasped + ")" + " §fleft." );
                server.commandManager.executeCommand(server, "tellraw @a [\"\",{\"text\":\"Timer Bonuses Used: \"},{\"score\":{\"name\":\"@p\",\"objective\":\"timerbonus\"},\"color\":\"dark_red\"}]");
                
                server.commandManager.executeCommand(server, "gamestage silentremove @p deepdark");

                event.player.sendChat("§3Developer Note: It's currently not possible to enter the End and beat the modpack. Until then, have fun exploring the Surface...");
            }
        });
    }
});

// Change player to spectator after dying when time is up
// On time is up
EventManager.getInstance().onTimeIsUp(function(event as TimeIsUpEvent){
    // On entity death
    events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent){
        if(event.entity.world.isRemote())
            return;

        // If event entity is a player
        if (event.entity instanceof IPlayer) {
            var player1 as IPlayer = event.entity;
            player1.executeCommand("fmvariable set timesup true false");

            events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent){
                //server.commandManager.executeCommand(server, "tpp " + event.player.name + " 686 100 300 100");
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your effort is meaningless. Welcome to your eternity.\",\"color\":\"dark_red\",\"italic\":false}]");
                server.commandManager.executeCommand(server, "effect @p minecraft:resistance 99999 255");
                server.commandManager.executeCommand(server, "clear @p");
            });
        }
    });
});


// Add to the timer bonuses used scoreboard counter when right clicking a timer bonuses
// onPlayerRightClickItem runs twice per click, which is why we have multiple scoreboards above
static timerBonus as IItemStack = <timeisup:timer_bonus>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack;     
        if ((itemStack.definition.id).matches(timerBonus.definition.id)) {  
            server.commandManager.executeCommand(server, "scoreboard players add @p timerbonus 1");
        }  
    }
});
