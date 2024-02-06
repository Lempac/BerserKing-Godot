extends Panel

func show_menu():
	if Global.CurrentGameUI.has_menu:
		return false
	else:
		Global.CurrentGameUI.has_menu = true
	Global.CurrentGameUI.add_child(self)
	get_tree().paused = true
	return true

func _on_return_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(Global.MainMenuScene)
