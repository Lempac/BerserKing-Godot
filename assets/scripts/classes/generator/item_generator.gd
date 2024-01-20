extends Node
class_name ItemGenerator

@export var item_resources : Array[ItemResource]
@export var items : Array[Item] = []

@warning_ignore("shadowed_variable")
func _init(item_resources : Array[ItemResource]) -> void:
	name = "ItemGenerator"
	self.item_resources = item_resources

func generate() -> void:
	
	pass
