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
import crafttweaker.event.CommandEvent;



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


// Timer bonus used adds to player data
static timerBonus as IItemStack = <timeisup:timer_bonus>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        if(!isNull(event.item.definition.id) && event.hand == "MAIN_HAND" && (event.item.definition.id).matches(timerBonus.definition.id)) {
            if(isNull(event.player.data.timerbonus)){
                event.player.update({timerbonus: 0});
            }

            event.player.update({timerbonus: event.player.data.timerbonus + 1});

            // If the player has used Chrono Absolution, timer bonuses now restore health and sanity
            if(event.player.data.usedChronoAbsolution == true){
                server.commandManager.executeCommand(server, "effect @p absorption 300 0");
                server.commandManager.executeCommand(server, "sanity add @p 10");
            }
        }  
    }
});

// Chrono Absolution clears timer bonus data
static chronoAbsolution as IItemStack = <contenttweaker:chrono_absolution>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        if(!isNull(event.item.definition.id) && event.hand == "MAIN_HAND" && (event.item.definition.id).matches(chronoAbsolution.definition.id)) {

            event.player.update({timerbonus: 0});
            
            server.commandManager.executeCommand(server, "effect @p wither 10 1");
            server.commandManager.executeCommand(server, "sanity add @p 100");
            server.commandManager.executeCommand(server, "playsound cyclicmagic:chaos_reaper master @p ~ ~ ~ 0.6 0.7");
            server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"The Veil's debt has been settled.\",\"color\":\"red\",\"italic\":true}]");
            server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Chrono Usurpation no longer steals time from future runs and now provides other beneficial effects.\",\"color\":\"gold\",\"italic\":false}]");
            event.player.update({usedChronoAbsolution: true});
            chronoAbsolution.mutable().shrink(1);
        }  
    }
});

// Handle run reset and adjust timer based on bonuses used
events.onCommand(function(event as crafttweaker.event.CommandEvent) {
    if (event.command.name == "reroll") {

    val sender = event.commandSender;
    if(!isNull(sender) && !isNull(sender.world)) {
        val playerName = sender.displayName;
        
        // Cast sender to IPlayer if it is a player
        if (sender instanceof IPlayer) {
            val player as IPlayer = sender;

            // Reset player data between runs
            player.update({clickedNetherBarrier: null});
            player.update({shatteredTraceOfDeath: null});
            player.update({clickedNetherObelisk: null});
            player.update({clickedEchoOfBetrayal: null});

            // Get the player's timer bonus count
            var bonusCount = 0;
            bonusCount = player.data.timerbonus as int;

            // Calculate new timer value (60 minutes - 1 minute per bonus used)
            var newTimerValue = 72000 - (bonusCount * 1200);
            
            // Set the new timer value
            player.world.catenation()
            .run(function(world, context) {
                context.data = world.time;
            })
            .sleep(100)
            .then(function(world, context) {
                Commands.call("advancement grant @p only triumph:advancements/hidden/unlock_journal", player, player.world, true, true);

                // Only do the following if the player has not used Chrono Absolution
                if(player.data.usedChronoAbsolution == false){
                    server.commandManager.executeCommand(server, "timer @p set " + newTimerValue);
                    if(bonusCount == 1){
                        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"The Veil whispers of debts unpaid. Your timer bears fresh scars from another's ambition.\",\"color\":\"red\",\"italic\":true}]");
                    }
                    else if(bonusCount == 2){
                        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Phantom screams echo through the ash. " + bonusCount + " minutes torn from your flesh by hands unseen. The Watcher hungers for compounded interest.\",\"color\":\"red\",\"italic\":true}]");
                    }
                    else if(bonusCount == 3){
                        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Reality shudders as " + bonusCount + " minutes are excised from your timeline - another's triumph written in your blood.\",\"color\":\"red\",\"italic\":true}]");
                    }
                    else if(bonusCount == 4){
                        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Debt must be paid. " + bonusCount + " minutes are torn from your flesh.\",\"color\":\"red\",\"italic\":true}]");
                    }
                    else if(bonusCount == 5){
                        Commands.call("advancement grant @p only triumph:advancements/journal_entries/chrono_usurpation_entry", player, player.world, true, true);
                        Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", player, player.world, true, true);
                        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"You awaken with someone else's memories burning behind your eyes. You quickly bring out your journal to write it down.\",\"color\":\"red\",\"italic\":true}]");
                        server.commandManager.executeCommand(server, "gamestage add @p unlocked_chrono_absolution");
                    }
                    else if(bonusCount >= 6){
                        server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Debt must be paid. " + bonusCount + " minutes are torn from your flesh.\",\"color\":\"red\",\"italic\":true}]");
                    }
                }
   
            })
            .start();
            
        }
    }
  }
});