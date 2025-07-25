
#> _your_namespace:calls/common_signals/on_ore_destroyed
#
# @executed	 at @s & align xyz 
#
# @within	_your_namespace:calls/common_signals/new_item [ at @s & align xyz ]
#

# Get in a score the item count and if it is a silk touch
scoreboard players set #item_count _your_namespace.data 0
scoreboard players set #is_silk_touch _your_namespace.data 0
execute store result score #item_count _your_namespace.data run data get entity @s Item.count
execute store success score #is_silk_touch _your_namespace.data if data entity @s Item.components."minecraft:custom_data".common_signals.silk_touch

# Try to destroy the block
execute as @e[tag=_your_namespace.custom_block, dx=0, dy=0, dz=0] at @s run function _your_namespace:custom_blocks/destroy

