extends GameObject

class_name Entity
@export var controller : Controller
@export var health : Health
@export var damage : int

func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)
	self.controller = Controller.new()
	add_child(self.controller)
	self.health = Health.new(data.max_health, data.health)
	add_child(self.health)
	self.damage = data.damage
	Global.health_killed.connect(func(entity): entity.despawn())
	Global.controller_touch.connect(func(entity, other):
		print(entity.name)
		print(other.name)
	)
