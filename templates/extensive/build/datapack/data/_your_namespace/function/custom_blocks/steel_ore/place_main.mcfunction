
#> _your_namespace:custom_blocks/steel_ore/place_main
#
# @within	_your_namespace:custom_blocks/place
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~-0.4 ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~-0.4 ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~-0.4 ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~ ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~ ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~ ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~0.4 ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~0.4 ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~-0.4 ~0.4 ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~-0.4 ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~-0.4 ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~-0.4 ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~ ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~ ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~ ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~0.4 ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~0.4 ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~ ~0.4 ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~-0.4 ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~-0.4 ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~-0.4 ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~ ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~ ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~ ~0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~0.4 ~-0.4 ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~0.4 ~ ]
#			_your_namespace:calls/smart_ore_generation/veins/steel_ore [ at @s & positioned ~0.4 ~0.4 ~0.4 ]
#

tag @s add _your_namespace.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:polished_deepslate
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display at @s run function _your_namespace:custom_blocks/steel_ore/place_secondary
tag @s remove _your_namespace.placer

# Increment count scores
scoreboard players add #total_custom_blocks _your_namespace.data 1
scoreboard players add #total_vanilla_polished_deepslate _your_namespace.data 1
scoreboard players add #total_steel_ore _your_namespace.data 1

