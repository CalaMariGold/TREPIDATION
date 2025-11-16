#loader crafttweaker reloadable
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.potions.IPotionEffect;
import mods.contenttweaker.Commands;


// Define the items that should cause burning/damage when held
// Replace these with your actual items
static burningItems as IItemStack[] = [
    <contenttweaker:raw_unstable_infernium>,
    <contenttweaker:unstable_sand>
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



// Cleansed Veilstrium Ingot
// Right click heat sand with veilstrium ingot, turns heat sand into soul sand and veilstrium ingot turns into cleansed veilstrium ingot
static veilstrium_ingot as IItemStack = <nethercraft:neridium_ingot>;
events.onPlayerInteractBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
    if(!event.world.isRemote()){
        val itemStack = event.item as IItemStack;     
        if ((itemStack.definition.id).matches(veilstrium_ingot.definition.id)) {  
            if(event.block.displayName == "Heat Sand"){
                
                Commands.call("setblock " + event.x + " " + event.y + " " + event.z + " minecraft:soul_sand", event.player, event.entity.world, true, true);
                Commands.call("give @p contenttweaker:cleansed_veilstrium_ingot", event.player, event.entity.world, true, true);

                Commands.call("playsound minecraft:block.soul_sand.place player @p ~ ~ ~ 1.0 1.0 1.0", event.player, event.entity.world, true, true);
                Commands.call("playsound enderskills:syphon player @p ~ ~ ~ 100 0.6", event.player, event.entity.world, true, true);

                itemStack.mutable().shrink(1);
            } 
        }
    }
});