
#> _your_namespace:v2.0.0/load/valid_dependencies
#
# @within	_your_namespace:v2.0.0/load/secondary
#			_your_namespace:v2.0.0/load/valid_dependencies 1t replace
#

# Waiting for a player to get the game version, but stop function if no player found
execute unless entity @p run schedule function _your_namespace:v2.0.0/load/valid_dependencies 1t replace
execute unless entity @p run return 0
execute store result score #game_version _your_namespace.data run data get entity @p DataVersion

# Check if the game version is supported
scoreboard players set #mcload_error _your_namespace.data 0
execute unless score #game_version _your_namespace.data matches 4435.. run scoreboard players set #mcload_error _your_namespace.data 1

# Decode errors
execute if score #mcload_error _your_namespace.data matches 1 run tellraw @a {"translate": "_your_namespace.extensive_template_error_this_version_is_made_for_minecraft_1_21","color":"red"}
execute if score #dependency_error _your_namespace.data matches 1 run tellraw @a {"translate": "_your_namespace.extensive_template_error_libraries_are_missingplease_download_th","color":"red"}
execute if score #dependency_error _your_namespace.data matches 1 unless score #common_signals.major load.status matches 0.. run tellraw @a {"translate": "_your_namespace.common_signals_v0_1_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/CommonSignals"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #common_signals.major load.status matches 0 unless score #common_signals.minor load.status matches 1.. run tellraw @a {"translate": "_your_namespace.common_signals_v0_1_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/CommonSignals"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #common_signals.major load.status matches 0 if score #common_signals.minor load.status matches 1 unless score #common_signals.patch load.status matches 1.. run tellraw @a {"translate": "_your_namespace.common_signals_v0_1_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/CommonSignals"}}
execute if score #dependency_error _your_namespace.data matches 1 unless score #smithed.custom_block.major load.status matches 0.. run tellraw @a {"translate": "_your_namespace.smithed_custom_block_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #smithed.custom_block.major load.status matches 0 unless score #smithed.custom_block.minor load.status matches 7.. run tellraw @a {"translate": "_your_namespace.smithed_custom_block_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #smithed.custom_block.major load.status matches 0 if score #smithed.custom_block.minor load.status matches 7 unless score #smithed.custom_block.patch load.status matches 1.. run tellraw @a {"translate": "_your_namespace.smithed_custom_block_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error _your_namespace.data matches 1 unless score #smithed.crafter.major load.status matches 0.. run tellraw @a {"translate": "_your_namespace.smithed_crafter_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #smithed.crafter.major load.status matches 0 unless score #smithed.crafter.minor load.status matches 7.. run tellraw @a {"translate": "_your_namespace.smithed_crafter_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #smithed.crafter.major load.status matches 0 if score #smithed.crafter.minor load.status matches 7 unless score #smithed.crafter.patch load.status matches 1.. run tellraw @a {"translate": "_your_namespace.smithed_crafter_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error _your_namespace.data matches 1 unless score #furnace_nbt_recipes.major load.status matches 1.. run tellraw @a {"translate": "_your_namespace.furnace_nbt_recipes_v1_9_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/FurnaceNbtRecipes"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #furnace_nbt_recipes.major load.status matches 1 unless score #furnace_nbt_recipes.minor load.status matches 9.. run tellraw @a {"translate": "_your_namespace.furnace_nbt_recipes_v1_9_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/FurnaceNbtRecipes"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #furnace_nbt_recipes.major load.status matches 1 if score #furnace_nbt_recipes.minor load.status matches 9 unless score #furnace_nbt_recipes.patch load.status matches 1.. run tellraw @a {"translate": "_your_namespace.furnace_nbt_recipes_v1_9_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/FurnaceNbtRecipes"}}
execute if score #dependency_error _your_namespace.data matches 1 unless score #smart_ore_generation.major load.status matches 1.. run tellraw @a {"translate": "_your_namespace.smartoregeneration_v1_7_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/SmartOreGeneration"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #smart_ore_generation.major load.status matches 1 unless score #smart_ore_generation.minor load.status matches 7.. run tellraw @a {"translate": "_your_namespace.smartoregeneration_v1_7_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/SmartOreGeneration"}}
execute if score #dependency_error _your_namespace.data matches 1 if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 7 unless score #smart_ore_generation.patch load.status matches 2.. run tellraw @a {"translate": "_your_namespace.smartoregeneration_v1_7_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/SmartOreGeneration"}}
execute if score #dependency_error _your_namespace.data matches 1 unless score $bs.math.major load.status matches 3.. run tellraw @a {"translate": "_your_namespace.bookshelf_math_v3_0_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/mcbookshelf/bookshelf/releases"}}
execute if score #dependency_error _your_namespace.data matches 1 if score $bs.math.major load.status matches 3 unless score $bs.math.minor load.status matches 0.. run tellraw @a {"translate": "_your_namespace.bookshelf_math_v3_0_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/mcbookshelf/bookshelf/releases"}}
execute if score #dependency_error _your_namespace.data matches 1 if score $bs.math.major load.status matches 3 if score $bs.math.minor load.status matches 0 unless score $bs.math.patch load.status matches 2.. run tellraw @a {"translate": "_your_namespace.bookshelf_math_v3_0_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/mcbookshelf/bookshelf/releases"}}

# Load Extensive Template
execute if score #game_version _your_namespace.data matches 1.. if score #mcload_error _your_namespace.data matches 0 if score #dependency_error _your_namespace.data matches 0 run function _your_namespace:v2.0.0/load/confirm_load

