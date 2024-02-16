extends Area2D

@export var item_name : String
var item_pick_menu = "res://assets/objects/menus/item_pick_up.tscn"

func _on_body_entered(body: Node2D) -> void:
	print("Runnning")
	var item_menu = load(item_pick_menu).instantiate()
	item_menu.show_menu($Sprite2D.texture, item_name)
	queue_free()
