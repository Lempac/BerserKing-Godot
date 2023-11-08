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
	var connection_data : Array[int]
	var type : int
	func _init(tile_position : Vector2i) -> void:
		self.tile_position = tile_position

func ProcessLevelTiles(layer := 0) -> Array[Tile]:
	var tiles: Array[Tile]
	var tile_position := Vector2i(0, 0)
	while HasTile(tile_position, layer):
		while HasTile(tile_position, layer):
			tiles.append(GetTile(tile_position, layer))
			tile_position.x += 1
		tile_position.x = 0
		tile_position.y += 1
	return tiles

func HasTile(tile_position: Vector2i, layer := 0) -> bool:
	var used_cells = get_used_cells(layer)
	return Rect2i(used_cells[0], used_cells[-1] - used_cells[0]).intersects(Rect2i(tile_position, tile_size))

func GetTile(Position: Vector2i, Layer: int = 0) -> Tile:
	var NewTile := Tile.new(Position)
	return NewTile

func _ready():
	tiles = ProcessLevelTiles()
