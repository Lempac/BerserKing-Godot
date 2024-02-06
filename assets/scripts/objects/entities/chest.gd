extends Area2D

var chest_menu = "res://assets/objects/menus/chest_menu.tscn"

func _on_body_entered(body: Node2D) -> void:
	var new_chest_menu = load(chest_menu).instantiate()
	if await new_chest_menu.show_menu():
		queue_free()
