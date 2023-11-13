extends Node
##Generator of level tile maps, generates.
class_name Generator
##Tilemap to use.
@export var level_data : LevelTileMap
##Entity to lock on the generation(spawn tilemap in it parent).
@export var lock_to_entity : Area2D
##Is generator running?
@export var is_running = false
##Dictionary of loaded chunks, key is chunk position.
@export var chunks_loaded := {}
##Dictionary of unloaded chunks, key is chunk position.
@export var chunks_unloaded := {}
##Range of tile generation, it will generate in radius, so it range*2+1.
@export var range := 1
##Seed used in generation.
@export var seed = 0
##Generators noise function.
@export var noise_generator = FastNoiseLite.new()
##Tilemap it generate on.
@export var tilemap : TileMap
##Template for empty tile.
@export var empty_tile : TileMapPattern

func _init(level_data : LevelTileMap, lock_to_entity : Area2D, seed := 0) -> void:
	empty_tile = TileMapPattern.new()
	empty_tile.set_size(level_data.tile_size)
	for x in level_data.tile_size.x:
		for y in level_data.tile_size.y:
			empty_tile.set_cell(Vector2(x, y))
	
	self.level_data = level_data
	self.lock_to_entity = lock_to_entity
	self.seed = seed
	noise_generator.seed = self.seed
	Global.generate_inited.emit(level_data, lock_to_entity)

##Start chunk generation, if not started.
func generate() -> void:
	if is_running:
		return
	is_running = true
	tilemap = TileMap.new()
	tilemap.tile_set = level_data.tile_set
	for layer in level_data.get_layers_count():
		tilemap.add_layer(layer)
		tilemap.set_layer_z_index(layer, level_data.get_layer_z_index(layer))
	lock_to_entity.get_parent().add_child(tilemap)
	while is_running:
		var position_tilemap = tilemap.local_to_map(lock_to_entity.position)
		var position = Vector2i(floor(float(position_tilemap.x) / level_data.tile_size.x), floor(float(position_tilemap.y) / level_data.tile_size.y)) * level_data.tile_size
		var range_with_tile_size = range*level_data.tile_size
		for x in range(position.x - range_with_tile_size.x, position.x + (range+1)*level_data.tile_size.x, level_data.tile_size.x):
			for y in range(position.y - range_with_tile_size.y, position.y + (range+1)*level_data.tile_size.y, level_data.tile_size.y):
					chunk_load(Vector2i(x,y), chunks_unloaded.get(Vector2i(x,y)))
		for chunk_position in chunks_loaded:
			if !Rect2i(position - range_with_tile_size, range_with_tile_size * (range * 2 + 1)).has_point(chunk_position):
				chunk_unload(chunk_position)
		await lock_to_entity.get_tree().process_frame
	Global.generate_stopped.emit(level_data, lock_to_entity)

##Load chunk at position in tilemap.
func chunk_load(position : Vector2i, tile : LevelTileMap.Tile = null) -> void:
	if chunks_loaded.has(position):
		return
	if tile == null:
		chunks_loaded[position] = level_data.tiles[abs(round(noise_generator.get_noise_2dv(position)*len(level_data.tiles)))]
	else:
		chunks_loaded[position] = tile
		chunks_unloaded.erase(position)
	tilemap.set_pattern(chunks_loaded[position].layer, position, chunks_loaded[position].pattern) 
	if tile == null:
		Global.generate_on_new_loaded.emit(position, tile)
	Global.generate_on_loaded.emit(position, tile)

##Unload chunk at position.
func chunk_unload(position : Vector2i) -> void:
	if chunks_unloaded.has(position):
		return
	chunks_unloaded[position] = chunks_loaded[position]
	chunks_loaded.erase(position)
	tilemap.set_pattern(chunks_unloaded[position].layer, position, empty_tile)
	Global.generate_on_unloaded.emit(position, chunks_unloaded[position])

##Stops the generator, returns if stopped.
func stop() -> bool:
	if not is_running:
		return false
	is_running = false
	return true
