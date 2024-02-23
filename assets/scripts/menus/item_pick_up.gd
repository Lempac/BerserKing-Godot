extends Panel

@onready var image := $MarginContainer/VBoxContainer/Image
@onready var label := $MarginContainer/VBoxContainer/Name

var item : Area2D

func show_menu(new_item: Area2D):
	if Global.CurrentGameUI.has_menu:
		return false
	else:
		Global.CurrentGameUI.has_menu = true
	Global.CurrentGameUI.add_child(self)
	item = new_item
	image.texture = item.texture
	label.text = item.item_name
	get_tree().paused = true
	return true

func _on_ok_button_pressed() -> void:
	Global.CurrentGameUI.inventory.add_slot(image.texture, label.text)
	Global.CurrentGameUI.has_menu = false
	item.callback.call()
	get_tree().paused = false
	item.queue_free()
	queue_free()

func _on_scrap_button_pressed() -> void:
	Global.CurrentGameUI.has_menu = false
	get_tree().paused = false
	item.queue_free()
	queue_free()
