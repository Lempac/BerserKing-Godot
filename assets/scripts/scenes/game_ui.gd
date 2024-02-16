extends CanvasLayer

@onready var inventory := $BoxContainer/Inventory
var has_menu = false

func _init() -> void:
	Global.CurrentGameUI = self

func _exit_tree() -> void:
	get_tree().paused = false

func _on_back_button_pressed() -> void:
	Global.CurrentGameKillCount = 0
	get_tree().change_scene_to_file(Global.MainMenuScene)
