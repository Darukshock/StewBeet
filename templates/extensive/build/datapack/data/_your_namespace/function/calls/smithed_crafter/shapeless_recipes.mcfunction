
#> _your_namespace:calls/smithed_crafter/shapeless_recipes
#
# @within	#smithed.crafter:event/shapeless_recipes
#

...
execute if score @s smithed.data matches 0 store result score @s smithed.data \
    if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe: [{id: "minecraft:deepslate", count: 9}]} \
    run loot replace block ~ ~ ~ container.16 loot _your_namespace:i/super_stone
...
