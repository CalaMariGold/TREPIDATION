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
        followRange:          52.0, // Vanilla: 64
        motionMultiplier:     0.8,  // Scales motion vectors (1.0 = normal, 0.5 = half speed, 2.0 = double)
    ],
    
    // Camouflage Spider (nethercraft:camouflage_spider)
    camouflageSpider: [
        vanillaHealth:        [35.0, 40.0], // for some reason, these can spawn as either
        maxHealth:            10.0,
    ],
    
    // Flame Spewer (primitivemobs:flame_spewer)
    flameSpewer: [
        vanillaHealth:        20.0,
        maxHealth:            3.0,
        movementSpeed:        0.5,
        followRange:          48.0,
        fireballDamageMultiplier: 0.1, // Fireball damage × this value (1.0 = normal)
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
        vanillaHealth:        20.0,
        maxHealth:            5.0,
        movementSpeed:        0.0, // Vanilla: 0.23
        followRange:          32.0, // Vanilla: 48
        fireballDamageMultiplier: 0.1, // Fireball damage × this value (1.0 = normal)
    ],
    
    // Silverfish (minecraft:silverfish)
    silverfish: [
        vanillaHealth:        8.0,
        maxHealth:            5.0, // Vanilla: 8
    ],
    
    // Magma Cube (minecraft:magma_cube)
    // Specify large (size 4) stats, smaller sizes auto-scale using vanilla ratios
    magmaCube: [
        largeMaxHealth:      16.0, // Vanilla: 16 (Medium: 4, Small: 1)
        largeOverrideDamage: 4.0,  // Vanilla: 6 (Medium: 4, Small: 3)
        largeMovementSpeed:  0.5, // Vanilla: 0.6 (Medium: 0.4, Small: 0.3)
    ],
]

// =============================================================================
// CODE BELOW
// =============================================================================

import net.minecraftforge.event.entity.living.LivingHurtEvent
import net.minecraftforge.event.entity.living.LivingEvent
import net.minecraft.entity.projectile.EntitySmallFireball
import net.minecraft.entity.monster.EntityBlaze
import net.minecraft.entity.SharedMonsterAttributes
import net.minecraft.entity.monster.EntityPigZombie
import net.minecraft.entity.monster.EntityWitherSkeleton
import net.minecraft.entity.monster.EntityGhast
import net.minecraft.entity.monster.EntityCreeper
import net.minecraft.entity.monster.EntityEnderman
import net.minecraft.entity.monster.EntityMagmaCube
import net.minecraft.entity.monster.EntitySilverfish
import net.minecraft.entity.EntityLivingBase
import net.minecraftforge.event.entity.EntityJoinWorldEvent

def darkZombieClass = entity('nethercraft:dark_zombie')?.getEntityClass()
def bloodyZombieClass = entity('nethercraft:bloody_zombie')?.getEntityClass()
def camouflageSpiderClass = entity('nethercraft:camouflage_spider')?.getEntityClass()
def flameSpewerClass = entity('primitivemobs:flame_spewer')?.getEntityClass()
def flameSpitClass = entity('primitivemobs:flame_spit')?.getEntityClass()
def festiveCreeperClass = entity('primitivemobs:festive_creeper')?.getEntityClass()
def blazingJuggernautClass = entity('primitivemobs:blazing_juggernaut')?.getEntityClass()
def eyesClass = entity('eyesinthedarkness:eyes')?.getEntityClass()

// Helper: Apply stats to a mob
def applyMobStats(entity, config, babyMult) {
    def isBaby = (entity instanceof EntityLivingBase && entity.isChild())
    
    // MAX_HEALTH
    if (config.maxHealth != null) {
        def healthAttr = entity.getEntityAttribute(SharedMonsterAttributes.MAX_HEALTH)
        def currentMax = entity.getMaxHealth()
        def health = config.maxHealth as double
        
        // Support single value or list of valid vanilla health values
        def vanillaHealthList = config.vanillaHealth instanceof List ? config.vanillaHealth : [config.vanillaHealth ?: 20.0d]
        def primaryVanillaHealth = vanillaHealthList[0] as double
        def isVanillaHealth = vanillaHealthList.any { (currentMax as double) == (it as double) }
        
        if (isBaby) {
            health = health * babyMult
            healthAttr.setBaseValue(health)
            entity.setHealth((float) entity.getMaxHealth())
        } else if (isVanillaHealth) {
            // Adults with vanilla health: apply our config
            healthAttr.setBaseValue(health)
            entity.setHealth((float) entity.getMaxHealth())
        } else {
            // Champions modified health with percentage scaling
            def ratio = currentMax / primaryVanillaHealth
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
    def immediate = source.getImmediateSource()
    
    // Blaze fireball damage
    if (immediate instanceof EntitySmallFireball && attacker instanceof EntityBlaze && mobConfigs.blaze?.fireballDamageMultiplier != null) {
        event.setAmount((float)(event.getAmount() * mobConfigs.blaze.fireballDamageMultiplier))
    }
    
    // Flame Spewer damage
    if (immediate?.getClass() == flameSpitClass && mobConfigs.flameSpewer?.fireballDamageMultiplier != null) {
        event.setAmount((float)(event.getAmount() * mobConfigs.flameSpewer.fireballDamageMultiplier))
    }
    
    // Bloody Zombie damage
    if (attacker != null && source.getDamageType() == "mob") {
        if (attacker.getClass() == bloodyZombieClass && mobConfigs.bloodyZombie?.overrideDamage != null) {
            event.setAmount((float)(mobConfigs.bloodyZombie.overrideDamage))
        }
    }
    
    // Magma cube damage override (they don't have ATTACK_DAMAGE attribute)
    if (attacker instanceof EntityMagmaCube && mobConfigs.magmaCube?.largeOverrideDamage != null) {
        def size = attacker.getSlimeSize()
        // Scale using vanilla ratio: (size+2)/6 (since large is 4+2 = 6)
        def damage = mobConfigs.magmaCube.largeOverrideDamage * (size + 2) / 6.0
        event.setAmount((float) damage)
    }
}

// Mob spawn handler
eventManager.listen(EventPriority.HIGHEST) { EntityJoinWorldEvent event ->
    def entity = event.getEntity()
    def babyMult = globalSettings.babyHealthMultiplier

    // Modded mobs (use cached entity classes)
    def entClass = entity.getClass()
    
    // Primitive Mobs (festive creeper handled above before vanilla creeper check)
    if (entClass == festiveCreeperClass && mobConfigs.festiveCreeper) {
        applyMobStats(entity, mobConfigs.festiveCreeper, babyMult)
        return
    }
    else if (entClass == flameSpewerClass && mobConfigs.flameSpewer) {
        applyMobStats(entity, mobConfigs.flameSpewer, babyMult)
    }
    else if (entClass == blazingJuggernautClass && mobConfigs.blazingJuggernaut) {
        applyMobStats(entity, mobConfigs.blazingJuggernaut, babyMult)
    }
    // Eyes in the Darkness
    else if (entClass == eyesClass && mobConfigs.eyes) {
        applyMobStats(entity, mobConfigs.eyes, babyMult)
    }

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
    if (entity instanceof EntitySilverfish) {
        applyMobStats(entity, mobConfigs.silverfish, babyMult)
        return
    }
    if (entity instanceof EntityBlaze) {
        applyMobStats(entity, mobConfigs.blaze, babyMult)
        return
    }
    // Magma cubes handled in LivingUpdateEvent
    
    // Nethercraft mobs
    if (entClass == darkZombieClass && mobConfigs.darkZombie) {
        applyMobStats(entity, mobConfigs.darkZombie, babyMult)
    }
    else if (entClass == bloodyZombieClass && mobConfigs.bloodyZombie) {
        applyMobStats(entity, mobConfigs.bloodyZombie, babyMult)
    }
    else if (entClass == camouflageSpiderClass && mobConfigs.camouflageSpider) {
        applyMobStats(entity, mobConfigs.camouflageSpider, babyMult)
    }
    
}

// Cache config lookups at script load (avoid repeated map access every tick)
def ghastMotionMult = mobConfigs.ghast?.motionMultiplier as Double
def ghastNeedsMotionScale = ghastMotionMult != null && ghastMotionMult != 1.0d
def magmaCubeConfig = mobConfigs.magmaCube

// Combined tick handler for ghasts and magma cubes
eventManager.listen { LivingEvent.LivingUpdateEvent event ->
    def entity = event.getEntityLiving()
    
    // Ghast motion - bypasses GhastMoveControl by scaling motion vectors directly
    if (ghastNeedsMotionScale && entity instanceof EntityGhast) {
        entity.motionX *= ghastMotionMult
        entity.motionY *= ghastMotionMult
        entity.motionZ *= ghastMotionMult
        return
    }
    
    // Magma cube stats - runs each tick because setSlimeSize() overwrites attributes
    if (entity instanceof EntityMagmaCube) {
        def size = entity.getSlimeSize()
        
        // Health: vanilla formula is size² (1, 4, 16)
        if (magmaCubeConfig?.largeMaxHealth) {
            def vanillaHealth = (size * size) as double
            def targetHealth = magmaCubeConfig.largeMaxHealth * vanillaHealth / 16.0
            
            if (Math.abs(targetHealth - vanillaHealth) > 0.01) {
                def currentMaxHealth = entity.getMaxHealth()
                if (Math.abs(currentMaxHealth - vanillaHealth) < 0.01) {
                    entity.getEntityAttribute(SharedMonsterAttributes.MAX_HEALTH).setBaseValue(targetHealth)
                    entity.setHealth((float) targetHealth)
                }
            }
        }
        
        // Movement speed: vanilla formula is 0.2 + 0.1 * size (0.3, 0.4, 0.6)
        if (magmaCubeConfig?.largeMovementSpeed) {
            def vanillaSpeed = 0.2d + 0.1d * size
            def targetSpeed = magmaCubeConfig.largeMovementSpeed * vanillaSpeed / 0.6d
            
            if (Math.abs(targetSpeed - vanillaSpeed) > 0.001) {
                def currentSpeed = entity.getEntityAttribute(SharedMonsterAttributes.MOVEMENT_SPEED).getBaseValue()
                if (Math.abs(currentSpeed - vanillaSpeed) < 0.001) {
                    entity.getEntityAttribute(SharedMonsterAttributes.MOVEMENT_SPEED).setBaseValue(targetSpeed)
                }
            }
        }
    }
}
