extends Control

@export var levels : Control
@export var level_tiles : PackedScene
@export var level_icon : PackedScene

func _ready():
	for level in self.level_tiles.instantiate().get_children():
		if level.level_name == "" or level.tile_size == Vector2i(0,0) or level.connection_size == Vector2i(0,0):
			continue
		var icon = self.level_icon.instantiate()
		level.tiles = level.process_level_tiles()
		icon.level_data = level
		levels.add_child(icon)

func _on_back_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)
