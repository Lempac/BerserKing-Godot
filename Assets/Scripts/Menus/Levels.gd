extends Control

@export var Levels : Control
@export_dir var LevelDataPath : String
@export var LevelIcon : PackedScene
var LevelsData : Array[Node2D]



func _ready():
	var dir = DirAccess.open(LevelDataPath)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			break
		elif !file_name.begins_with("."):
			LevelsData.append(load(LevelDataPath + file_name).instantiate())
	dir.list_dir_end()
	for LevelData in LevelsData:
		var levelicon = LevelIcon.instantiate()
		levelicon.Text = LevelData.get_name()
		levelicon.View.add_child(LevelData)
		Levels.add_child(levelicon)


func _on_back_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)
