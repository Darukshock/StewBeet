
# Imports
import os

import requests
from beet import Model
from model_resolver import Render
from stouputils.io import super_copy, super_open
from stouputils.parallel import multithreading
from stouputils.print import debug, warning

from ...core.__memory__ import Mem
from ...core.constants import (
	CUSTOM_BLOCK_VANILLA,
	DOWNLOAD_VANILLA_ASSETS_RAW,
	DOWNLOAD_VANILLA_ASSETS_SOURCE,
	OVERRIDE_MODEL,
	RESULT_OF_CRAFTING,
	USED_FOR_CRAFTING,
)
from .shared_import import SharedMemory


# Generate iso renders for every item in the definitions
def generate_all_iso_renders():
	definitions: dict[str, dict] = Mem.definitions
	ns: str = Mem.ctx.project_id

	# Create the items folder
	path = SharedMemory.cache_path + "/items"
	os.makedirs(f"{path}/{ns}", exist_ok = True)

	# For every item, get the model path and the destination path
	cache_assets: bool = Mem.ctx.meta.get("stewbeet",{}).get("manual", {}).get("cache_assets", True)
	textures_folder: str = Mem.ctx.meta.get("stewbeet",{}).get("textures_folder", "assets/textures")
	for_model_resolver: dict[str, str] = {}
	for item, data in definitions.items():

		# Skip items that don't have models
		if not data.get("item_model"):
			continue

		# If it's not a block, simply copy the texture
		try:
			if data["id"] == CUSTOM_BLOCK_VANILLA:
				raise ValueError()
			if not os.path.exists(f"{path}/{ns}/{item}.png") or not cache_assets:
				if data.get(OVERRIDE_MODEL, None) != {}:
					source: str = f"{textures_folder}/{item}.png"
					if os.path.exists(source):
						super_copy(source, f"{path}/{ns}/{item}.png")
					else:
						warning(f"Missing texture for item '{item}', please add it manually to '{path}/{ns}/{item}.png'")

		# Else, add the block to the model resolver list
		except ValueError:
			# Skip if item is already generated (to prevent OpenGL launching for nothing)
			if os.path.exists(f"{path}/{ns}/{item}.png") and cache_assets:
				continue

			# Add to the model resolver queue (only if present in resource pack)
			model: Model = Mem.ctx.assets[ns].models.get(f"item/{item}")
			rp_path = f"{ns}:item/{item}"
			dst_path = f"{path}/{ns}/{item}.png"
			if model is not None and model.get_content().get("textures", None) is not None:
				for_model_resolver[rp_path] = dst_path

	# Launch model resolvers for remaining blocks
	if len(for_model_resolver) > 0:

		## Model Resolver v0.12.0
		# model_resolver_main(
		# 	render_size = config['opengl_resolution'],
		# 	load_dir = load_dir,
		# 	output_dir = None,	# type: ignore
		# 	use_cache = False,
		# 	minecraft_version = "latest",
		# 	__special_filter__ = for_model_resolver	# type: ignore
		# )

		## Model Resolver v1.8.2
		debug(f"Generating iso renders for {len(for_model_resolver)} items, this may take a while...")
		render = Render(Mem.ctx)
		for rp_path, dst_path in for_model_resolver.items():
			render.add_model_task(rp_path, path_save=dst_path, animation_mode="one_file")
		render.run()
		debug("Generated iso renders for all items")

	## Copy every used vanilla items
	# Get every used vanilla items
	used_vanilla_items = set()
	for data in definitions.values():
		all_crafts: list[dict] = list(data.get(RESULT_OF_CRAFTING,[]))
		all_crafts += list(data.get(USED_FOR_CRAFTING,[]))
		for recipe in all_crafts:
			ingredients = []
			if "ingredients" in recipe:
				ingredients = recipe["ingredients"]
				if isinstance(ingredients, dict):
					ingredients = ingredients.values()
			elif "ingredient" in recipe:
				ingredients = [recipe["ingredient"]]
			for ingredient in ingredients:
				if "item" in ingredient:
					used_vanilla_items.add(ingredient["item"].split(":")[1])
			if "result" in recipe and "item" in recipe["result"]:
				used_vanilla_items.add(recipe["result"]["item"].split(":")[1])
		pass

	# Download all the vanilla textures from the wiki
	def download_item(item: str):
		destination = f"{path}/minecraft/{item}.png"
		if not (os.path.exists(destination) and cache_assets):	# If not downloaded yet or not using cache
			link: str = f"{DOWNLOAD_VANILLA_ASSETS_RAW}/item/{item}.png"
			response = requests.get(link)
			if response.status_code == 200:
				with super_open(destination, "wb") as file:
					file.write(response.content)
			else:
				link = link.replace("item/", "block/")
				response = requests.get(link)
				if response.status_code == 200:
					with super_open(destination, "wb") as file:
						file.write(response.content)
				else:
					warning(f"Failed to download texture '{link}', please add it manually to '{destination}'")
					warning(f"Suggestion link: '{DOWNLOAD_VANILLA_ASSETS_SOURCE}'")

	# Multithread the download
	multithreading(download_item, used_vanilla_items, max_workers=min(32, len(used_vanilla_items)))

