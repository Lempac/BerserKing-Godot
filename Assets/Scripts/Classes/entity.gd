extends GameObject

class_name Entity
@export var controller : Controller
@export var health : Health
func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)
	self.controller = Controller.new(self)
	add_child(self.controller)
	health = Health.new()
	add_child(health)
