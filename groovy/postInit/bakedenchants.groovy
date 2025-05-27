import mods.bakedenchants.BakedEnchants

//BakedEnchants.add(ItemStack, Enchantment, int)
BakedEnchants.add(item('nethercraft:pyridium_sword:*'), enchantment('minecraft:fire_aspect'), 1)
BakedEnchants.add(item('nethercraft:pyridium_bow:*'), enchantment('minecraft:flame'), 1)
BakedEnchants.add(item('simpleores:tin_pickaxe:*'), enchantment('minecraft:efficiency'), 2)

crafting.addShaped(item('nethercraft:pyridium_sword'), [
    [null,item('nethercraft:pyridium_ingot'),null],
    [null,item('nethercraft:pyridium_ingot'),null],
    [null,item('minecraft:blaze_rod'),null]
]);

crafting.addShaped(item('nethercraft:pyridium_bow'), [
    [null,item('minecraft:blaze_rod'),item('minecraft:string')],
    [item('nethercraft:pyridium_ingot'),null,item('minecraft:string')],
    [null,item('minecraft:blaze_rod'),item('minecraft:string')]
]);

crafting.addShaped(item('simpleores:tin_pickaxe'), [
    [item('minecraft:quartz'),item('minecraft:quartz'),item('minecraft:quartz')],
    [item('nethercraft:lava_reeds_item'),item('nethercraft:glowood_stick'),item('nethercraft:lava_reeds_item')],
    [null,item('nethercraft:glowood_stick'),null]
]);