extends Control

@export var Title : Label
@export var Text : String
@export var View : SubViewport


var original_size := scale
var grow_size := Vector2(1.1, 1.1)

func _ready():
	name = name+str(get_parent().get_child_count())
	Title.text = Text

func grow_btn(end_size : Vector2, duration: float) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale', end_size, duration)


func _on_gui_input(event):
	if event.is_action_pressed("left_click"):
		Global.CurrentLevel = View.get_child(0).scene_file_path
		get_tree().change_scene_to_file(Global.GameScene)


func _on_mouse_entered():
	grow_btn(grow_size, .1)


func _on_mouse_exited():
	grow_btn(original_size, .1)
