#loader crafttweaker reloadable
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemDefinition;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.block.IBlockState;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.api.event.timeisup.TimeIsUpEvent;
import crafttweaker.events.timeisup.EventManager;
import crafttweaker.api.event.timeisup.TickEvent;
import mods.contenttweaker.Commands;
import crafttweaker.event.PlayerChangedDimensionEvent;
import crafttweaker.event.PlayerCraftedEvent;


static tablet as IItemStack = <corpsecomplex:scroll>;
static timerBonus as IItemStack = <timeisup:timer_bonus>;

// Veilstrium armor pieces
static veilstrium_helmet as IItemStack = <nethercraft:neridium_helmet:*>;
static veilstrium_chestplate as IItemStack = <nethercraft:neridium_chestplate:*>;
static veilstrium_leggings as IItemStack = <nethercraft:neridium_leggings:*>;
static veilstrium_boots as IItemStack = <nethercraft:neridium_boots:*>;

// Store sanity value in player data
zenClass SanityData {
    static sanityBeforeDeath as int = 0;
    static hasShownTimerWarning as bool = false;
    static hasTriggeredTimerEnd as bool = false;
}

// Player death sanity decrease
events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent) {
    if(!event.entity.world.isRemote()) {
        if (event.entity instanceof IPlayer) {
            var player as IPlayer = event.entity;
            // Store current sanity value
            SanityData.sanityBeforeDeath = player.sanity;
        }
    }
});

// Restore sanity on respawn with death penalty
events.onPlayerRespawn(function(event as crafttweaker.event.PlayerRespawnEvent) {
    if(!event.entity.world.isRemote()) {
        var newSanity = SanityData.sanityBeforeDeath - 5;
        Commands.call("sanity set " + event.player.name + " " + newSanity, event.player, event.entity.world, true, true);
    }
});

// Timer-related sanity decrease
EventManager.getInstance().onTimerTick(function(event as TickEvent) {
    if(event.player.world.isRemote())
        return;
    var totalSecs = event.tick/20;
    var minutes = (totalSecs % 3600) / 60;
    
    // Low timer sanity drain (last 5 minutes)
    if(minutes == 4) {
        if(event.tick % 100 == 0) { // Every 5 seconds
            Commands.call("sanity remove " + event.player.name + " 1", event.player, event.player.world, true, true);
        }
        // Show message only once when entering the 5-minute threshold
        if(!SanityData.hasShownTimerWarning) {
            server.commandManager.executeCommand(server, "tellraw @p [\"\",{\"text\":\"Your grip on reality weakens...\",\"color\":\"dark_red\",\"italic\":true}]");
            SanityData.hasShownTimerWarning = true;
        }
    } else {
        // Reset the warning flag when above 5 minutes
        SanityData.hasShownTimerWarning = false;
    }
});

// Timer end sanity drain
EventManager.getInstance().onTimerTick(function(event as TickEvent) {
    if(event.player.world.isRemote())
        return;
        
    var totalSecs = event.tick/20;
    if(totalSecs == 1 && !SanityData.hasTriggeredTimerEnd) {
        server.commandManager.executeCommand(server, "sanity remove @p 100");
        SanityData.hasTriggeredTimerEnd = true;
    }
    else {
        SanityData.hasTriggeredTimerEnd = false;
    }
});

// Deep Dark dimension sanity drain
// Lore friendly message is within globalEvents.zs
events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
    if(!event.player.world.isRemote()) {
        if(event.player.dimension == 10) { // Deep Dark dimension ID
            if(event.player.world.time % 100 == 0) { // Every 5 seconds
                Commands.call("sanity remove " + event.player.name + " 0.5", event.player, event.player.world, true, true);
            }
        }
    }
});

// Trace of Death subsequent uses
static traceofdeath as IItemStack = <enderskills:token>;
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent) {
    if(!event.world.isRemote()) {
        val itemStack = event.item as IItemStack;
        if(!isNull(itemStack)) {
            if(traceofdeath.matches(itemStack)) {
                if(!isNull(event.player.data.shatteredTraceOfDeath)) {
                    Commands.call("sanity remove " + event.player.name + " 10", event.player, event.world, true, true);
                }
            }
        }
    }
});

// Dreadstone tablet sanity increase on craft
events.onPlayerCrafted(function(event as PlayerCraftedEvent) {
    if(!event.player.world.isRemote()) {
        if(tablet.matches(event.output)) {
            Commands.call("sanity add " + event.player.name + " 10", event.player, event.player.world, true, true);
        }
    }
});

// Timer Bonus use sanity increase
events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent) {
    if(!event.world.isRemote()) {
        val itemStack = event.item as IItemStack;
        if(!isNull(itemStack)) {
            if(timerBonus.matches(itemStack)) {
                Commands.call("sanity add " + event.player.name + " 20", event.player, event.world, true, true);
            }
        }
    }
});




// Dimension transition sanity increase in globalEvents.zs





// Veilstrium armor set bonus
events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
    if(event.player.world.isRemote()) {
        return;
    }

    if(event.player.world.time % 600 == 0) { // Every 30 seconds
        // Check if wearing full set
        if(!isNull(event.player.getItemInSlot(IEntityEquipmentSlot.head())) && 
            !isNull(event.player.getItemInSlot(IEntityEquipmentSlot.chest())) &&
            !isNull(event.player.getItemInSlot(IEntityEquipmentSlot.legs())) &&
            !isNull(event.player.getItemInSlot(IEntityEquipmentSlot.feet()))) {
            
            if(veilstrium_helmet.matches(event.player.getItemInSlot(IEntityEquipmentSlot.head())) &&
                veilstrium_chestplate.matches(event.player.getItemInSlot(IEntityEquipmentSlot.chest())) &&
                veilstrium_leggings.matches(event.player.getItemInSlot(IEntityEquipmentSlot.legs())) &&
                veilstrium_boots.matches(event.player.getItemInSlot(IEntityEquipmentSlot.feet()))) {
                
                Commands.call("sanity add " + event.player.name + " 1", event.player, event.player.world, true, true);
            }
        }
    }
}); 