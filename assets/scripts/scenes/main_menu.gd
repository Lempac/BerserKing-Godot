extends Control

func _on_play_button_pressed():
	Global.CurrentGameKillCount = 0
	Global.change_scene("res://assets/scripts/globals/default_transition.tscn", Global.PlayScene, "fade")


func _on_options_button_pressed():
	get_tree().change_scene_to_file(Global.OptionsScene)


func _on_quit_button_pressed():
	get_tree().quit()
