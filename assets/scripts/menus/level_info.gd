extends Control

@export var title : Label

@export var level_data : LevelTileMap:
	set(value):
		level_data = value
		title.text = value.level_name
var original_size := scale
var grow_size := Vector2(1.1, 1.1)

func _ready():
	name = name+str(get_parent().get_child_count())

func grow_btn(end_size : Vector2, duration: float) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale', end_size, duration)

func _on_gui_input(event):
	if event.is_action_pressed("left_click"):
		Global.CurrentLevel = level_data
		get_tree().change_scene_to_file(Global.GameScene)

func _on_mouse_entered():
	grow_btn(grow_size, .1)

func _on_mouse_exited():
	grow_btn(original_size, .1)
