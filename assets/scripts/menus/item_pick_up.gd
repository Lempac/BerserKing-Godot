extends Panel

@onready var image := $MarginContainer/VBoxContainer/Image
@onready var label := $MarginContainer/VBoxContainer/Name

func show_menu(image_res: Texture, text: String):
	if Global.CurrentGameUI.has_menu:
		return false
	else:
		Global.CurrentGameUI.has_menu = true
	Global.CurrentGameUI.add_child(self)
	image.texture = image_res
	label.text = text
	get_tree().paused = true
	return true

func _on_ok_button_pressed() -> void:
	Global.CurrentGameUI.inventory.add_slot(image.texture, label.text)
	Global.CurrentGameUI.has_menu = false
	get_tree().paused = false
	queue_free()

func _on_scrap_button_pressed() -> void:
	Global.CurrentGameUI.has_menu = false
	get_tree().paused = false
	queue_free()
