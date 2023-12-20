extends Node
class_name Health
@export var health : int
@export var max_health : int
@export var health_regenerate : int

func take_damage(damage : int):
	health-=damage
	await get_tree().create_timer(0.1).timeout
	Global.health_took_damage.emit(self)
	if health <= 0:
		Global.health_killed.emit(get_parent())
	
func _init(max_health : int, health : int, health_regenerate : int = 0):
	self.health = health
	self.max_health = max_health
	self.health_regenerate = health_regenerate
	
	#savienot no global.gd controller 
	Global.controller_touch.connect(on_touch)
	
func on_touch(entity : Entity, other : Entity):
	if entity == get_parent():
		take_damage(other.damage)

func _process(delta: float) -> void:
	await get_tree().create_timer(1).timeout
	if health+health_regenerate < max_health:
		health+=health_regenerate
