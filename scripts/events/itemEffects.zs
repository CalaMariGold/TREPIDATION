#loader crafttweaker reloadable
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.potions.IPotionEffect;

// Define the items that should cause burning/damage when held
// Replace these with your actual items
static burningItems as IItemStack[] = [
    <contenttweaker:raw_unstable_infernium>
];

events.onEntityLivingUpdate(function(event as crafttweaker.event.EntityLivingUpdateEvent) {
    if(!event.entity.world.isRemote()) {
        if (event.entityLivingBase instanceof IPlayer) {
            var player as IPlayer = event.entityLivingBase;
            var heldItem = player.currentItem;
            
            if(!isNull(heldItem)) {
                // Check if the held item should cause burning
                for item in burningItems {
                    if(item.matches(heldItem)) {
                        // Apply fire effect
                        server.commandManager.executeCommand(server, "effect @p potioncore:fire 1 0");
                        break;
                    }
                }
            }
        }
    }
}); 