extends Node

class_name Inventory
var size: int

class Slot:
	pass

@warning_ignore("shadowed_variable")
func _init(size) -> void:
	self.size = size
	
