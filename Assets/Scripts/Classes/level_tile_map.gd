extends TileMap
##Contains data about level.

class_name LevelTileMap

@export var level_name : String
@export_multiline var description : String
@export var tile_size : Vector2i
@export var connection_size : Vector2i
@export var tiles: Array[Tile]

class Tile extends Resource:
	var tile_position : Vector2i
	var pattern : TileMapPattern
	var connection_data : Array[int]
	var type : int
	var layer : int
	func _init(tile_position : Vector2i, type: int, layer : int, pattern : TileMapPattern) -> void:
		self.tile_position = tile_position
		self.type = type
		self.pattern = pattern
		self.layer = layer

func process_level_tiles(layer := 0) -> Array[Tile]:
	var tiles: Array[Tile]
	var tile_position := Vector2i(0, 0)
	while has_tile(tile_position, layer):
		while has_tile(tile_position, layer):
			tiles.append(get_tile(tile_position, layer))
			tile_position.x += tile_size.x
		tile_position.x = 0
		tile_position.y += tile_size.y
	return tiles

func has_tile(tile_position: Vector2i, layer := 0) -> bool:
	var area = Rect2i(tile_position, tile_size)
	for used_cells in get_used_cells(layer):
		if area.has_point(used_cells):
			return true
	return false

func get_tile(tile_position: Vector2i, layer: int = 0) -> Tile:
	var pattern : TileMapPattern
	var positions : Array[Vector2i] = []
	for x in tile_size.x:
		for y in tile_size.y:
			positions.append(Vector2i(tile_position.x + x, tile_position.y + y))
	var new_tile := Tile.new(tile_position, len(tiles), layer, get_pattern(layer, positions))
	return new_tile
