extends Entity

class_name Player

@export var controller : Controller
@export var inventory : Inventory
@export var camera : Camera2D

func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data, do_spawning)
	controller = Controller.new(self)
	add_child(controller)
	camera = Camera2D.new()
	add_child(camera)
