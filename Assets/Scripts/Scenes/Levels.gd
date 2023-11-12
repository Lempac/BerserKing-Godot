extends Control

@export var Levels : Control
@export var LevelTiles : PackedScene
@export var LevelIcon : PackedScene

func _ready():
	for level in LevelTiles.instantiate().get_children():
		if level.level_name == "" or level.tile_size == Vector2i(0,0) or level.connection_size == Vector2i(0,0):
			continue
		var levelicon = LevelIcon.instantiate()
		level.tiles = level.process_level_tiles()
		levelicon.LevelData = level
		Levels.add_child(levelicon)

func _on_back_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)
