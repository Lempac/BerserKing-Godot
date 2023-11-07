extends TileMap
##Contains data about level.

class_name LevelTileMap

@export var Name : String
@export_multiline var Description : String
@export var TileSize : Vector2i
@export var ConnectionSize : Vector2i

var Tiles: Array[Tile]

class Tile:
	var Position : Vector2i
	var ConnectionData : Array[int]
	var Type : int
	func _init(Position : Vector2i) -> void:
		self.Position = Position

func ProcessLevelTiles(Layer := 0) -> Array[Tile]:
	var Tiles: Array[Tile]
	var Position := Vector2i(0, 0)
	while HasTile(Position, Layer):
		while HasTile(Position, Layer):
			Tiles.append(GetTile(Position, Layer))
			Position.x += 1
		Position.x = 0
		Position.y += 1
	return Tiles

func HasTile(Position: Vector2i, Layer := 0) -> bool:
	var used_cells = get_used_cells(Layer)
	return Rect2i(used_cells[0], used_cells[-1] - used_cells[0]).intersects(Rect2i(Position, TileSize))

func GetTile(Position: Vector2i, Layer: int = 0) -> Tile:
	var NewTile := Tile.new(Position)
	return NewTile

func _ready():
	Tiles = ProcessLevelTiles()
