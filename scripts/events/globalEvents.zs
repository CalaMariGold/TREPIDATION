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


// Heart Dust Healing
static heart_dust as IItemStack = <scalinghealth:heartdust>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemstack = event.item as IItemStack; 
        if(!isNull(itemstack)){
            if (heart_dust.matches(itemstack)) {  

                Commands.call("playsound enderskills:heal_self master CalaMariGold ~ ~ ~ 0.5 1.7", event.player, event.world, true, true);
                event.player.health = event.player.health + 1;  
                itemstack.mutable().shrink(1);
            }
        }
    }
});


// Soul Anchor: sets spawn
static soul_anchor as IItemStack = <contenttweaker:soul_anchor>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemstack = event.item as IItemStack; 
        if(!isNull(itemstack)){
            if (soul_anchor.matches(itemstack)) {  
                if (event.player.dimension == -1) {
                    server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Can not be used in the Nether.\",\"color\":\"dark_red\",\"italic\":true}]");
                }
                else {
                    server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your soul has been bound to this position. Be sure not to obstruct this area.\",\"color\":\"dark_red\",\"italic\":true}]");
                    Commands.call("setworldspawn ~ ~ ~", event.player, event.world, true, true);
                    Commands.call("spawnpoint @p ~ ~ ~", event.player, event.world, true, true);
                    itemstack.mutable().shrink(1);
                }
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
        server.commandManager.executeCommand(server, "op " + event.player.name);
        Commands.call("advancement grant @p only triumph:advancements/dimensions/start", event.player, event.entity.world, true, true);

        // for some reason, journal entries only unlock after an achievement is granted a few seconds after world start
        event.player.world.catenation()
        .run(function(world, context) {
            context.data = world.time;
        })
        .sleep(100)
        .then(function(world, context) {
            Commands.call("advancement grant @p only triumph:advancements/hidden/unlock_journal", event.player, event.entity.world, true, true);
        })
        .start();
        
        event.player.update({firstTimeJoin: true});
    }
});


// Prevent players falling back down into the prev dim when respawning
events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent){
    if(!event.entity.world.isRemote()){
        if(event.player.dimension != -1){
            Commands.call("setblock ~ 0 ~ dimstack:portal", event.player, event.entity.world, true, true);
        }
    }
});

// Output some neccessary speedrun information in chat when escaping a dimension for the first time
events.onPlayerChangedDimension(function(event as crafttweaker.event.PlayerChangedDimensionEvent){


    // Nether to Erebus
    if((event.from == -1 && event.to == 5)){
        Commands.call("setblock ~ 0 ~ dimstack:portal", event.player, event.entity.world, true, true);
        Commands.call("effect @p clear", event.player, event.entity.world, true, true);
    }

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


    if((event.to == 684)){
        server.commandManager.executeCommand(server, "clear @p");
        server.commandManager.executeCommand(server, "give @p minecraft:torch");
        server.commandManager.executeCommand(server, "title @p times 40 120 60");
        server.commandManager.executeCommand(server, "title @p subtitle {\"text\":\"There is no escape\", \"color\":\"gray\"}");
        server.commandManager.executeCommand(server, "title @p title {\"text\":\"§kLimbo\", \"bold\":false, \"italic\":false, \"color\":\"white\"}");
    }

    if((event.from == 684 && event.to == 1) || (event.from == 684 && event.to == 0)){
        server.commandManager.executeCommand(server, "tpp " + event.player.name + " 684 100 500 100");
        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"YOUR EFFORT IS MEANINGLESS. THERE IS NO ESCAPE.\",\"color\":\"dark_red\",\"italic\":false}]");
    }
});

events.onEntityLivingUpdate(function(event as crafttweaker.event.EntityLivingUpdateEvent) {
    if(!event.entity.world.isRemote()){
        if (event.entityLivingBase instanceof IPlayer) {
            var player as IPlayer = event.entityLivingBase;
            
            if(player.dimension == 684){
                server.commandManager.executeCommand(server, "effect @p minecraft:resistance 99999 255");
                server.commandManager.executeCommand(server, "effect @p minecraft:wither 99999 0");
                server.commandManager.executeCommand(server, "effect @p minecraft:slowness 99999 1");
                server.commandManager.executeCommand(server, "effect @p srparasites:fear 99999 0");
                server.commandManager.executeCommand(server, "effect @p elenaidodge2:weight 99999 0");
                server.commandManager.executeCommand(server, "hunger @p 20");
            }
        }
    }
});


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
                //player teleported via fancymenu
                server.commandManager.executeCommand(server, "advancement grant @p only triumph:advancements/dimensions/limbo");
                server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your effort is meaningless. Welcome to your eternity.\",\"color\":\"dark_red\",\"italic\":false}]");
                
                
                event.player.world.catenation()
                .run(function(world, context) {
                    context.data = world.time;
                })
                .sleep(300)
                .then(function(world, context) {
                    Commands.call("summon wyrmsofnyrus:thevisitor ~ ~+100 ~", event.player, event.entity.world, true, true);
                    Commands.call("playsound wyrmsofnyrus:visitormessage master CalaMariGold ~ ~ ~ 10.0 0.5", event.player, event.entity.world, true, true);
                })
                .start();
                
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
