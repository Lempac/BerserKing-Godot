extends CharacterBody2D
class_name Health
@export var health : int
@export var max_health : int

func take_damage(damage : int):
	health-=damage
	if health <= 0:
		pass
		
func die():
	queue_free()
	
	
func _init(max_health : int, health : int):
	self.health = health
	self.max_health = max_health
