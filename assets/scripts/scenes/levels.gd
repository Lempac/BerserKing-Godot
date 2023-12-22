extends Control

@export var levels : Control
@export var level_tiles : PackedScene
@export var level_icon : PackedScene

func _ready():
	for level in self.level_tiles.instantiate().get_children():
		if level.level_name == "" or level.tile_size == Vector2i(0,0) or level.connection_size == Vector2i(0,0):
			continue
		var levelicon = self.LevelIcon.instantiate()
		level.tiles = level.process_level_tiles()
		levelicon.LevelData = level
		levels.add_child(levelicon)

func _on_back_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)
