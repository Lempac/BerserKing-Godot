extends Node
class_name Health
@export var health : int
@export var max_health : int

func take_damage(damage : int):
	health-=damage
	await get_tree().create_timer(0.1).timeout
	if health <= 0:
		pass
		
func die():
	queue_free()
	
	
func _init(max_health : int, health : int):
	self.health = health
	self.max_health = max_health
	#savienot no global.gd controller 
	Global.controller_touch.connect(on_touch)
	
func on_touch(entity : Entity, other : Entity):
	if entity == get_parent():
		take_damage(10)
	
	
