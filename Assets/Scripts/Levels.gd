extends Control

@export var Levels : Control
@export var LevelDataPath : String
@export var LevelIcon : PackedScene
var LevelData : Array[Level_Resource]

@export var MainMenu : String

func _ready():
	var dir = DirAccess.open(LevelDataPath)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif !file_name.begins_with("."):
			#get_next() returns a string so this can be used to load the images into an array.
			LevelData.append(load(LevelDataPath + file_name))
	dir.list_dir_end()
	for level in LevelData:
		var levelicon = LevelIcon.instantiate()
		levelicon.Text = level.Name
		Levels.add_child(levelicon)


func _on_back_pressed():
	get_tree().change_scene_to_file(MainMenu)
