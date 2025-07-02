#loader mixin

import native.net.minecraft.inventory.EntityEquipmentSlot;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.entity.EntityLivingBase;

//Courtesy of roidrole
//Removes the fire resistance from the BOMD Flame Armor
//Tested on 1.4, 1.5-1 and 1.6.
#mixin {targets:"com.dungeon_additions.da.event.EventWearFlameArmor"}
zenClass MixinEventWearFlameArmor{
    #mixin Static
    #mixin Redirect 
    #{
    #   method: "onEquipArmor",
    #   at:{
    #       value:"INVOKE",
    #       target:"Lnet/minecraft/entity/EntityLivingBase;func_184582_a(Lnet/minecraft/inventory/EntityEquipmentSlot;)Lnet/minecraft/item/ItemStack;",
    #       ordinal:0
    #   }
    #}
    function failFlameArmorCheck(entity as EntityLivingBase, slotIn as EntityEquipmentSlot) as ItemStack{
        return ItemStack.EMPTY;
    }
}
