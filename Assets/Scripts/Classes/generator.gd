extends Node

class_name Generator

@export var level_data : LevelTileMap
@export var lock_to_entity : Area2D
@export var is_running = false
@export var tiles := {}
@export var seed = 0
@export var noise_generator = FastNoiseLite.new()

func _init(level_data : LevelTileMap, lock_to_entity : Area2D, seed := 0) -> void:
	self.level_data = level_data
	self.lock_to_entity = lock_to_entity
	self.seed = seed
	noise_generator.seed = self.seed
	Global.generate_inited.emit(level_data, lock_to_entity)

func generate() -> void:
	if is_running:
		return
	is_running = true
	var tilemap = TileMap.new()
	tilemap.tile_set = level_data.tile_set
	for layer in level_data.get_layers_count():
		tilemap.add_layer(layer)
		tilemap.set_layer_z_index(layer, level_data.get_layer_z_index(layer))
	lock_to_entity.get_parent().add_child(tilemap)
	while is_running:
		var position_tilemap = tilemap.local_to_map(lock_to_entity.position)
		var position = Vector2i(floor(float(position_tilemap.x) / level_data.tile_size.x), floor(float(position_tilemap.y) / level_data.tile_size.y)) * 16
		if !tiles.has(position):
			tiles[position] = level_data.tiles[abs(round(noise_generator.get_noise_2dv(position)*len(level_data.tiles)))]
			tilemap.set_pattern(tiles[position].layer, position, tiles[position].pattern) 
		await lock_to_entity.get_tree().process_frame

func stop() -> bool:
	if not is_running:
		return false
	is_running = false
	return true
