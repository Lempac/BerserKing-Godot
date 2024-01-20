extends Control

@export var fps_slider : HSlider
@export var fps_label : Label

func _ready() -> void:
	self.fps_slider.value = Engine.max_fps
	self.fps_label.text = str(self.fps_slider.value)+" FPS:"

func _on_back_button_pressed():
	get_tree().change_scene_to_file(Global.MainMenuScene)

func _on_h_slider_value_changed(value: float) -> void:
	Engine.max_fps = self.fps_slider.value
	self.fps_label.text = str(self.fps_slider.value)+" FPS:"
