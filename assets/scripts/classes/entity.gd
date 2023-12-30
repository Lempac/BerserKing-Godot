extends GameObject

class_name Entity
@export var controller : Controller
@export var health : Health
@export var damage : int

func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)
	self.damage = data.damage
	self.controller = Controller.new(data.speed)
	self.health = Health.new(data.max_health, data.health, data.health_regenerate)
	add_child(self.controller)
	add_child(self.health)
