extends Node

class_name Inventory
var max_size: int
var items: Array[Item]

@warning_ignore("shadowed_variable")
func _init(max_size) -> void:
	name = "Inventory"
	self.max_size = max_size
	
