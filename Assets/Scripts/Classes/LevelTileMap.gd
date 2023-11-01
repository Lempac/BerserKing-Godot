extends TileMap
##Contains data about level.

class_name LevelTileMap

@export var Name : String
@export var TileSize : Vector2i
@export var ConnectionSize : Vector2i

var Tiles: Array[Tile]

class Tile:
	var Position : Vector2i
	var ConnectionData : Array[int]

func ProcessLevelTiles(Layer: int = 0) -> Array[Tile]:
	var Tiles: Array[Tile]
	var Position := Vector2i(0, 0)
	while HasTile(Position):
		while HasTile(Position):
			Tiles.append(GetTile(Position, Layer))
			Position.x += 1
		Position.y += 1
	return Tiles

func HasTile(Position: Vector2i) -> bool:
	return get_used_rect().intersects(Rect2i(Position, TileSize))

func GetTile(Position: Vector2i, Layer: int = 0) -> Tile:
	var NewTile := Tile.new()
	return NewTile

func _ready():
	Tiles = ProcessLevelTiles()
