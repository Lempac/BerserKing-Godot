extends CanvasLayer

func _init() -> void:
	Global.CurrentGameUI = self

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(Global.MainMenuScene)
