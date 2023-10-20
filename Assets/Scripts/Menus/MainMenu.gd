extends Control


func _on_play_button_pressed():
	get_tree().change_scene_to_file(Global.PlayScene)


func _on_options_button_pressed():
	get_tree().change_scene_to_file(Global.OptionsScene)


func _on_quit_button_pressed():
	get_tree().quit()
