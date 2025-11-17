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
import crafttweaker.world.IWorld;
import crafttweaker.event.PlayerAdvancementEvent;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeModifier;
import mods.contenttweaker.Commands;
import crafttweaker.event.CommandEvent;
import crafttweaker.event.BlockPlaceEvent;


// On time is up
EventManager.getInstance().onTimerTick(function(event as TickEvent){
    if(event.world.isRemote())
        return;

    var totalSecs = event.tick/20;
    if(totalSecs <= 0) {
        if(!isNull(event.player)){
            Commands.call("fmvariable set timesup true false", event.player, event.player.world, true, true);
        }
    }
});



/*
// Timer Ward
static timerWard as IItemStack = <timeisup:timer_ward>;
events.onBlockPlace(function(event as crafttweaker.event.BlockPlaceEvent){
    if(!event.world.isRemote()){
        if((event.block.definition.id).matches(timerWard.definition.id)) {
            server.commandManager.executeCommand(server, "say test");
            event.player.world.catenation()
            .run(function(world, context) {
                context.data = world.time;
            })
            .sleep(40)
            .then(function(world, context) {
                Commands.call("setblock " + event.x + " " + event.y + " " + event.z + " minecraft:air", event.player, event.player.world, true, true);
            })
            .start();

        }  
    }
});
*/



// Timer bonus used adds to player data
static timerBonus as IItemStack = <timeisup:timer_bonus>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        if(!isNull(event.item.definition.id) && (event.item.definition.id).matches(timerBonus.definition.id)) {

            // If the player has used Chrono Absolution, timer bonuses now restore health and sanity
            if(event.player.data.usedChronoAbsolution == true){
                server.commandManager.executeCommand(server, "effect @p absorption 300 0");
                server.commandManager.executeCommand(server, "sanity add @p 10");
            }

            // Increase timer bonus count
            if(!isNull(event.player) && !isNull(event.player.data.timerbonus)){
                Commands.call("playsound timeisup:timer master " + event.player.name, event.player, event.player.world, true, true);
                event.player.update({timerbonus: event.player.data.timerbonus + 1 as int});
            } else {
                server.commandManager.executeCommand(server, "say Error: timerbonus data not found. Please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
            }
        }  
    }
});

// Chrono Absolution clears timer bonus data
static chronoAbsolution as IItemStack = <contenttweaker:chrono_absolution>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        if(!isNull(event.item.definition.id) && event.hand == "MAIN_HAND" && (event.item.definition.id).matches(chronoAbsolution.definition.id)) {

            if(!isNull(event.player)){
                event.player.update({timerbonus: 0 as int});
                event.player.update({usedChronoAbsolution: true});
            } else {
                server.commandManager.executeCommand(server, "say Error: player data not found. Please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
            }
            
            server.commandManager.executeCommand(server, "effect @p wither 10 1");
            server.commandManager.executeCommand(server, "sanity add @p 100");
            Commands.call("playsound enderskills:animated_stone player " + event.player.name + " ~ ~ ~ 5.0", event.player, event.player.world, true, true);
            event.player.sendChat("§c§oThe Veil's debt has been settled.");
            event.player.sendChat("§6Chrono Usurpation now permanently provides increased sanity and absorption.");
            server.commandManager.executeCommand(server, "gamestage silentadd @p used_chrono_absolution");
            event.item.mutable().shrink(1);
            
        }  
    }
});

// Chrono Anchor
static chronoAnchor as IItemStack = <timeisup:timer_anchor>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        if((event.item.definition.id).matches(chronoAnchor.definition.id)) {
            event.player.sendChat("§c§oYou awaken with someone else's memories burning behind your eyes. You quickly bring out your journal to write it down.");
            Commands.call("playsound minecraft:ui.toast.in master @p", event.player, event.player.world, true, true);
        }  
    }
});

// Handle run reset and adjust timer based on bonuses used
events.onCommand(function(event as crafttweaker.event.CommandEvent) {
    if (event.command.name == "reroll") {

        if(isNull(event.commandSender)){
            server.commandManager.executeCommand(server, "say Error: command sender not found. Please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
        }

        val sender = event.commandSender;
        val player as IPlayer = sender;

        Commands.call("fmvariable set timesup false false", player, player.world, true, true);

        // Reset NON-PERSISTANT player data between runs 
        if(!isNull(player)){
            player.update({clickedNetherBarrier: null});
            player.update({shatteredTraceOfDeath: null});
            player.update({clickedNetherObelisk: null});
            player.update({clickedEchoOfBetrayal: null});
        } else {
            server.commandManager.executeCommand(server, "say Error: player data not found. Please report this to the TREPIDATION GitHub. Describe recent events leading up to this.");
        }

        // Get the player's timer bonus count
        var bonusCount = 0;
        bonusCount = player.data.timerbonus as int;

        // Calculate new timer value (60 minutes - 1 minute per bonus used)
        var newTimerValue = 72000 - (bonusCount * 1200);

        // Get the nether world to ensure catenation runs in the correct dimension
        val netherWorld = IWorld.getFromID(-1);
                    
        // Set the new timer value
        netherWorld.catenation()
        .run(function(world, context) {
            context.data = world.time;
        })
        .sleep(100)
        .then(function(world, context) {
            server.commandManager.executeCommand(server, "timer @p set " + newTimerValue);

            // Chrono Anchor
            // Unlocks after first failed run
            if(player.data.failedRuns >= 1){
                if(!player.hasGameStage("unlocked_chrono_anchor")){
                    server.commandManager.executeCommand(server, "gamestage silentadd @p unlocked_chrono_anchor");
                    Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", player, player.world, true, true);
                    player.sendChat("§c§oYou awaken with someone else's memories burning behind your eyes. You quickly bring out your journal to write it down.");
                    player.sendChat("§3Soul Anchor can now be crafted.");
                    player.sendChat("§3Chrono Anchor can now be crafted.");
                    Commands.call("playsound minecraft:ui.toast.in master @p", player, player.world, true, true);
                    Commands.call("advancement grant @p only triumph:advancements/journal_entries/chrono_anchor_entry", player, player.world, true, true);
                }
            }

            // Do more things after more failed runs!!
            // 

            // Chrono Usurpation uses
            if(bonusCount == 1){
                player.sendChat("§c§oThe Veil whispers of debts unpaid. Your timer bears fresh scars from another's ambition. " + bonusCount + " minute is torn from your flesh.");
                Commands.call("playsound minecraft:ui.toast.in master @p", player, player.world, true, true);
            }
            else if(bonusCount == 2){
                player.sendChat("§c§o" + bonusCount + " minutes torn from your flesh by hands unseen. It hungers for compounded interest.");
                Commands.call("playsound minecraft:ui.toast.in master @p", player, player.world, true, true);
            }
            else if(bonusCount == 3){
                player.sendChat("§c§o" + bonusCount + " minutes are excised from your timeline, another's triumph written in your blood.");
                Commands.call("playsound minecraft:ui.toast.in master @p", player, player.world, true, true);
            }
            else if(bonusCount == 4 || bonusCount >= 6){
                player.sendChat("§c§oDebt must be paid. " + bonusCount + " minutes are torn from your flesh.");
                Commands.call("playsound minecraft:ui.toast.in master @p", player, player.world, true, true);
            }
            // Unlock Chrono Absolution
            else if(bonusCount >= 5){
                if(!player.hasGameStage("unlocked_chrono_absolution")){ 
                    server.commandManager.executeCommand(server, "gamestage silentadd @p unlocked_chrono_absolution");
                    Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", player, player.world, true, true);

                    player.sendChat("§3Chrono Absolution can now be crafted.");
                    player.sendChat("§c§oYou awaken with someone else's memories burning behind your eyes. You quickly bring out your journal to write it down.");
                    Commands.call("advancement grant @p only triumph:advancements/journal_entries/chrono_usurpation_entry", player, player.world, true, true);
                }
            }
        })
        .start(); 
  }
});