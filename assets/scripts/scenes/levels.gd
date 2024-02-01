extends Control

@export var levels_menu : Control
@export_dir var levels_path
@export var level_icon : PackedScene

func _ready():
	var dir = DirAccess.open(levels_path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			break
		elif !file_name.begins_with("."):
			var level : TileMap = load(levels_path + "/" + file_name).instantiate()
			var icon = self.level_icon.instantiate()
			icon.level = level
			icon.title.text = level.name
			levels_menu.add_child(icon)
	dir.list_dir_end()

func _on_back_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)
