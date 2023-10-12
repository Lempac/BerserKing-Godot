extends Control
@export var PlayScene : String
@export var OptionsScene : String

func _on_play_button_pressed():
	get_tree().change_scene_to_file(PlayScene)


func _on_options_button_pressed():
	get_tree().change_scene_to_file(OptionsScene)


func _on_quit_button_pressed():
	get_tree().quit()
