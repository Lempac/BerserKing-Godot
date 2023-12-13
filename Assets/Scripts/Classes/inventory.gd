extends Node

class_name Inventory
var size: int

class Slot:
	pass

func _init(size) -> void:
	self.size = size
