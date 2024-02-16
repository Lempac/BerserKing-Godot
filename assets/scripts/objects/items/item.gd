extends Area2D

@export var item_name : String
@export var texture : Texture
@export_enum("Item", "Weapon") var type = 0

var item_menu = "res://assets/objects/menus/item_pick_up.tscn"
var callback : Callable

func _ready() -> void:
	if item_name == "":
		item_name = name

func _on_body_entered(body: Node2D) -> void:
	var new_item_menu = load(item_menu).instantiate()
	match type:
		0:
			callback = func(): pass
		1:
			callback = func():
				print(item_name)
				if item_name != "Bow":
					return
				var bow = load("res://assets/objects/weapons/bow/bow.tscn").instantiate()
				if !Global.CurrentPlayer.has_node("Bow"):
					Global.CurrentPlayer.add_child(bow)
	new_item_menu.show_menu(self)
