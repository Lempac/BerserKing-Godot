extends Panel

@export var image : TextureRect
@export var label : Label

func show_menu(image_res: Texture, text: String):
	image.texture = image_res
	label.text = text
	Global.CurrentGameUI.add_child(self)

func _on_ok_button_pressed() -> void:
	Global.CurrentGameUI.inventory.add_slot(image.texture)
	queue_free()
