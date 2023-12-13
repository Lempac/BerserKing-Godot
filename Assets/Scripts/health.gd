extends CharacterBody2D
class_name Health
@export var health = 0
@export var max_health = 100

func take_damage(damage : int):
	health-=damage
	if health <= 0:
		die()
		
func die():
	queue_free()
	
	
func _init():
	health = max_health
