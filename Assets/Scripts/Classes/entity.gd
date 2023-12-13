extends GameObject

class_name Entity
@export var controller : Controller

func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)
	self.controller = Controller.new(self)
	add_child(self.controller)
