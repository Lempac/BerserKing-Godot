extends Control

@export var Levels : Control
@export var LevelTiles : PackedScene
@export var LevelIcon : PackedScene

func _ready():
	for Level in LevelTiles.instantiate().get_children():
		var levelicon = LevelIcon.instantiate()
		levelicon.LevelData = Level
		Levels.add_child(levelicon)

func _on_back_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)
