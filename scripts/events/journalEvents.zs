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

static dreadswine_entry as IItemStack = <contenttweaker:dreadswine_entry>;
static foulite_dust_entry as IItemStack = <contenttweaker:foulite_dust_entry>;
static nether_wraith_entry as IItemStack = <contenttweaker:nether_wraith_entry>;
static veilstrium_entry as IItemStack = <contenttweaker:veilstrium_entry>;
static infernium_entry as IItemStack = <contenttweaker:infernium_entry>;
static glowood_entry as IItemStack = <contenttweaker:glowood_entry>;
static ashen_oracle_entry as IItemStack = <contenttweaker:ashen_oracle_entry>;
static ashen_revenant_entry as IItemStack = <contenttweaker:ashen_revenant_entry>;
static sanity_entry as IItemStack = <contenttweaker:sanity_entry>;


// IMPORTANT:
// Patchouli entries can never be taken away on run resets
// due to a bug where the journal button will stop working if the player was previously viewing an entry that was removed.


/* Intro chapters:
Always unlocked:
- Welcome
- Movement & Combat
- Essential Tips
- Runs & Timer
- Sanity

Unlocked when obtaining skill book:
- Grimoire of the Veil (via config\triumph\script\triumph\advancements\journal_entries\skill_book.txt)
*/

/* Main chapters:
- Nether (unlocked at start, \config\triumph\script\triumph\advancements\dimensions\nether.txt)
- Limbo (unlocked when entering Limbo, \config\triumph\script\triumph\advancements\dimensions\limbo.txt)
*/

// Chat messages for new main chapters
events.onPlayerAdvancement(function(event as crafttweaker.event.PlayerAdvancementEvent){
    if(!event.entity.world.isRemote()){
                
        // Limbo chat msg sent in globalEvents.zs

        if(event.player.data.hasJournalEntryNether == false){
            if(event.id == "triumph:advancements/hidden/unlock_journal"){
                event.player.sendChat("§3§oA new page was added to your journal. View your journal by clicking the book icon in your inventory.");
                event.player.update({hasJournalEntryNether: true});
            }
        }
    }
});


events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent){
    if(!event.world.isRemote()){
        val itemStack1 = event.item as IItemStack; 

        
        if(!isNull(itemStack1)){

            // Entry #?? - Sanity
            if (sanity_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/sanity_entry", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }
            
            // Entry #24 - Ashen Oracle
            if (ashen_oracle_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/ashen_oracle_entry", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #22 - Ashen Revenant
            if (ashen_revenant_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/ashen_revenant_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #22 - Trace of Death
            // Unlocked via netherEvents.zs
            // triumph:advancements/journal_entries/trace_of_death_entry

            // Entry #7 - Dreadswine
            if (dreadswine_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/dreadswine_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #9 - Foulite Dust
            if (foulite_dust_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/foulite_dust_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #5 - Nether Wraith
            if (nether_wraith_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/nether_wraith_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #11 - Veilstrium
            if (veilstrium_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/veilstrium_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #15 - Infernium
            if (infernium_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/infernium_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #2 - Glowood
            if (glowood_entry.matches(itemStack1)) {  
                Commands.call("advancement grant @p only triumph:advancements/journal_entries/glowood_entry", event.player, event.world, true, true);
                Commands.call("sanity add " + event.player.name + " 10", event.player, event.world, true, true);
                Commands.call("playsound enderskills:page_turn player @p ~ ~ ~ 10", event.player, event.world, true, true);
                event.player.sendChat("§3§oA new page was added to your journal.");
                itemStack1.mutable().shrink(1);
            }

            // Entry #26 - Chrono Usurpation
            // Unlocked via timerAndRunEvents.zs
            // triumph:advancements/journal_entries/chrono_usurpation_entry

            // Entry #36 - Chrono Anchor
            // Unlocked via timerAndRunEvents.zs
            // triumph:advancements/journal_entries/chrono_anchor_entry
        }
    }
});


