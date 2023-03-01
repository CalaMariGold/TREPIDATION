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


// Add potion effects to certain foods
HungerEvents.onFoodEaten(function(event as mods.hungertweaker.events.FoodEatenEvent) {
	if (event.player.world.isRemote()) {
		return;
	}

    // Fire resist for scrambled magma eggs
	if (event.food.definition.id == <contenttweaker:scrambled_magma_eggs>.definition.id) {
		var fire_resistance = <potion:minecraft:fire_resistance>.makePotionEffect(200, 0, false, false);
		event.player.addPotionEffect(fire_resistance);
	}

    // Fire resist + strength for deviled egg sandwich
    if (event.food.definition.id == <contenttweaker:deviled_egg_sandwich>.definition.id) {
		var fire_resistance = <potion:minecraft:fire_resistance>.makePotionEffect(600, 0, false, false);
        var strength = <potion:minecraft:strength>.makePotionEffect(600, 0, false, false);
		event.player.addPotionEffect(fire_resistance);
        event.player.addPotionEffect(strength);
	}

    // Strength for devil's bread
    if (event.food.definition.id == <nethercraft:devil_bread>.definition.id) {
        var strength = <potion:minecraft:strength>.makePotionEffect(200, 0, false, false);
        event.player.addPotionEffect(strength);
	}

    // Glowing for glow apple
    if (event.food.definition.id == <nethercraft:glow_apple>.definition.id) {
		var glowing = <potion:minecraft:glowing>.makePotionEffect(100, 0, false, false);
		event.player.addPotionEffect(glowing);
	}

    // Glowing for glow stew
    if (event.food.definition.id == <nethercraft:glow_stew>.definition.id) {
		var glowing = <potion:minecraft:glowing>.makePotionEffect(200, 0, false, false);
		event.player.addPotionEffect(glowing);
	}
});