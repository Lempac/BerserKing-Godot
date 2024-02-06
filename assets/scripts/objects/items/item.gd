extends Area2D

@export var item_name : String
var item_menu = "res://assets/objects/menus/item_pick_up.tscn"

func _ready() -> void:
	if item_name == "":
		item_name = name

func _on_body_entered(body: Node2D) -> void:
	var new_item_menu = load(item_menu).instantiate()
	if new_item_menu.show_menu($Sprite2D.texture, item_name):
		queue_free()
