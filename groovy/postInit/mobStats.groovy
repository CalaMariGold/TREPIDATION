// Reduce blaze fireball damage to 10% of original (Blaze only)
import net.minecraftforge.event.entity.living.LivingHurtEvent
import net.minecraft.entity.projectile.EntitySmallFireball
import net.minecraft.entity.monster.EntityBlaze

eventManager.listen { LivingHurtEvent event ->
    def source = event.getSource()
    if (source.getImmediateSource() instanceof EntitySmallFireball && 
        source.getTrueSource() instanceof EntityBlaze) {
        event.setAmount((float)(event.getAmount() * 0.1f))
    }
}