/*
 * =============================================================================
 * MOB STATS CONFIGURATION
 * =============================================================================
 * Set any value to null to keep the vanilla default.
 * 
 * Available attributes:
 *   - maxHealth:    Hit points (1 = half heart)
 *   - attackDamage: Damage dealt (1 = half heart)
 *   - movementSpeed: Movement speed multiplier. Actual speed ≈ value × 20 blocks/sec
 *   - followRange:  Distance (blocks) mob will chase targets
 *   - knockbackResistance: 0.0 = none, 1.0 = immune to knockback
 *   - armor:        Armor points
 */

// ============ GLOBAL SETTINGS ============
def globalSettings = [
    babyHealthMultiplier: 0.5,  // Baby mobs get this × adult HP (0.5 = half HP)
]

// ============ MOB STAT CONFIGS ============
// Format: [attribute: value] or [attribute: null] to keep vanilla

def mobConfigs = [
    // Zombie Pigman (minecraft:zombie_pigman)
    pigZombie: [
        vanillaHealth:        20.0, // used for Champions compatibility check
        maxHealth:            20.0, // Vanilla: 20
        attackDamage:         1.0,  // Vanilla: 5
        movementSpeed:        0.23, // Vanilla: 0.23
        followRange:          30.0, // Vanilla: 35
        knockbackResistance:  1.0, // Vanilla: 0
        armor:                null, // Vanilla: 2
    ],
    
    // Dark Zombie (nethercraft:dark_zombie)
    darkZombie: [
        vanillaHealth:        50.0,
        maxHealth:            15.0,
        attackDamage:         4.0,
        movementSpeed:        0.25,
        followRange:          35,
        knockbackResistance:  0.8,
        armor:                4.0,
    ],
    
    // Bloody Zombie (nethercraft:bloody_zombie)
    bloodyZombie: [
        vanillaHealth:        35.0,
        maxHealth:            10.0,
        attackDamage:         null, // doesn't work, use overrideDamage instead
        overrideDamage:       2.0, // Force this exact damage on melee attacks
        movementSpeed:        0.4,
        followRange:          35,
        knockbackResistance:  0.0,
        armor:                null, // default: 2.0
    ],
    
    // Wither Skeleton (minecraft:wither_skeleton)
    witherSkeleton: [
        vanillaHealth:        20.0,
        maxHealth:            15.0, // Vanilla: 20
        attackDamage:         2.0, // Vanilla: 8
        movementSpeed:        0.25, // Vanilla: 0.25
        followRange:          16.0, // Vanilla: 16
        knockbackResistance:  0.0, // Vanilla: 0
        armor:                null, // Vanilla: 0
    ],
    
    // Ghast (minecraft:ghast)
    ghast: [
        vanillaHealth:        10.0,
        maxHealth:            3.0,
    ],
    
    // Camouflage Spider (nethercraft:camouflage_spider)
    camouflageSpider: [
        vanillaHealth:        35.0,
        maxHealth:            10.0,
    ],
    
    // Flame Spewer (primitivemobs:flame_spewer)
    flameSpewer: [
        vanillaHealth:        20.0,
        maxHealth:            3.0,
    ],
    
    // Festive Creeper (primitivemobs:festive_creeper)
    festiveCreeper: [
        vanillaHealth:        20.0,
        maxHealth:            10.0,
    ],
    
    // Creeper (minecraft:creeper)
    creeper: [
        followRange:          30.0, // Vanilla: 16
    ],
    
    // Blazing Juggernaut (primitivemobs:blazing_juggernaut)
    blazingJuggernaut: [
        vanillaHealth:        20.0,
        maxHealth:            10.0,
        attackDamage:         4.0,
        followRange:          24.0,
        knockbackResistance:  1.0,
    ],
    
    // Eyes in the Darkness (eyesinthedarkness:eyes)
    eyes: [
        movementSpeed:        1.1,
        followRange:          100.0,
    ],
    
    // Enderman (minecraft:enderman)
    enderman: [
        vanillaHealth:        40.0,
        maxHealth:            100.0,
    ],
    
    // Blaze (minecraft:blaze)
    blaze: [
        fireballDamageMultiplier: 0.1, // Fireball damage × this value (1.0 = normal)
    ],
]

// =============================================================================
// CODE BELOW
// =============================================================================

import net.minecraftforge.event.entity.living.LivingHurtEvent
import net.minecraft.entity.projectile.EntitySmallFireball
import net.minecraft.entity.monster.EntityBlaze
import net.minecraft.entity.SharedMonsterAttributes
import net.minecraft.entity.monster.EntityPigZombie
import net.minecraft.entity.monster.EntityWitherSkeleton
import net.minecraft.entity.monster.EntityGhast
import net.minecraft.entity.monster.EntityCreeper
import net.minecraft.entity.monster.EntityEnderman
import net.minecraft.entity.EntityLivingBase
import net.minecraftforge.event.entity.EntityJoinWorldEvent
import net.minecraft.util.ResourceLocation
import net.minecraftforge.fml.common.registry.EntityEntry
import net.minecraftforge.fml.common.registry.ForgeRegistries

// Helper: Get entity registry name
def getEntityId(entity) {
    def entry = ForgeRegistries.ENTITIES.getEntries().find { it.getValue().getEntityClass() == entity.getClass() }
    return entry?.getKey()?.toString()
}

// Helper: Apply stats to a mob
def applyMobStats(entity, config, babyMult) {
    def isBaby = (entity instanceof EntityLivingBase && entity.isChild())
    
    // MAX_HEALTH
    if (config.maxHealth != null) {
        def healthAttr = entity.getEntityAttribute(SharedMonsterAttributes.MAX_HEALTH)
        def currentMax = entity.getMaxHealth()
        def vanillaHealth = (config.vanillaHealth ?: 20.0d) as double
        def health = config.maxHealth as double
        
        if (isBaby) {
            health = health * babyMult
            healthAttr.setBaseValue(health)
            entity.setHealth((float) entity.getMaxHealth())
        } else if (currentMax == vanillaHealth) {
            // Adults with vanilla health: apply our config
            healthAttr.setBaseValue(health)
            entity.setHealth((float) entity.getMaxHealth())
        } else {
            // Champions modified health with percentage scaling
            def ratio = currentMax / vanillaHealth
            def newHealth = health * ratio
            healthAttr.setBaseValue(newHealth)
            entity.setHealth((float) entity.getMaxHealth())
        }
    }
    
    if (config.attackDamage != null) {
        entity.getEntityAttribute(SharedMonsterAttributes.ATTACK_DAMAGE).setBaseValue(config.attackDamage as double)
    }
    if (config.movementSpeed != null) {
        entity.getEntityAttribute(SharedMonsterAttributes.MOVEMENT_SPEED).setBaseValue(config.movementSpeed as double)
    }
    if (config.followRange != null) {
        entity.getEntityAttribute(SharedMonsterAttributes.FOLLOW_RANGE).setBaseValue(config.followRange as double)
    }
    if (config.knockbackResistance != null) {
        entity.getEntityAttribute(SharedMonsterAttributes.KNOCKBACK_RESISTANCE).setBaseValue(config.knockbackResistance as double)
    }
    if (config.armor != null) {
        entity.getEntityAttribute(SharedMonsterAttributes.ARMOR).setBaseValue(config.armor as double)
    }
}

// Damage modification handler
eventManager.listen { LivingHurtEvent event ->
    def source = event.getSource()
    def attacker = source.getTrueSource()
    
    // Blaze fireball damage
    if (mobConfigs.blaze?.fireballDamageMultiplier != null &&
        source.getImmediateSource() instanceof EntitySmallFireball && 
        attacker instanceof EntityBlaze) {
        event.setAmount((float)(event.getAmount() * mobConfigs.blaze.fireballDamageMultiplier))
    }
    
    // Override damage for specific mobs
    if (attacker != null && source.getDamageType() == "mob") {
        def attackerId = getEntityId(attacker)
        
        if (attackerId == "nethercraft:bloody_zombie" && mobConfigs.bloodyZombie?.overrideDamage != null) {
            event.setAmount((float)(mobConfigs.bloodyZombie.overrideDamage))
        }
    }
}

// Mob spawn handler
eventManager.listen(EventPriority.HIGHEST) { EntityJoinWorldEvent event ->
    def entity = event.getEntity()
    def babyMult = globalSettings.babyHealthMultiplier
    
    // Vanilla mobs
    if (entity instanceof EntityPigZombie) {
        applyMobStats(entity, mobConfigs.pigZombie, babyMult)
        return
    }
    if (entity instanceof EntityWitherSkeleton) {
        applyMobStats(entity, mobConfigs.witherSkeleton, babyMult)
        return
    }
    if (entity instanceof EntityGhast) {
        applyMobStats(entity, mobConfigs.ghast, babyMult)
        return
    }
    if (entity instanceof EntityCreeper) {
        applyMobStats(entity, mobConfigs.creeper, babyMult)
        return
    }
    if (entity instanceof EntityEnderman) {
        applyMobStats(entity, mobConfigs.enderman, babyMult)
        return
    }
    
    // Nethercraft mobs
    def entityId = getEntityId(entity)
    
    if (entityId == "nethercraft:dark_zombie" && mobConfigs.darkZombie) {
        applyMobStats(entity, mobConfigs.darkZombie, babyMult)
    }
    else if (entityId == "nethercraft:bloody_zombie" && mobConfigs.bloodyZombie) {
        applyMobStats(entity, mobConfigs.bloodyZombie, babyMult)
    }
    else if (entityId == "nethercraft:camouflage_spider" && mobConfigs.camouflageSpider) {
        applyMobStats(entity, mobConfigs.camouflageSpider, babyMult)
    }

    // Primitive Mobs
    else if (entityId == "primitivemobs:flame_spewer" && mobConfigs.flameSpewer) {
        applyMobStats(entity, mobConfigs.flameSpewer, babyMult)
    }
    else if (entityId == "primitivemobs:festive_creeper" && mobConfigs.festiveCreeper) {
        applyMobStats(entity, mobConfigs.festiveCreeper, babyMult)
    }
    else if (entityId == "primitivemobs:blazing_juggernaut" && mobConfigs.blazingJuggernaut) {
        applyMobStats(entity, mobConfigs.blazingJuggernaut, babyMult)
    }
    // Eyes in the Darkness
    else if (entityId == "eyesinthedarkness:eyes" && mobConfigs.eyes) {
        applyMobStats(entity, mobConfigs.eyes, babyMult)
    }
}
