extends CharacterBody2D
class_name Health
@export var health : int
@export var max_health : int

func take_damage(damage : int):
	health-=damage
	if health <= 0:
		pass

func _init(max_health : int , health : int):
	self.max_health = max_health
	self.health = health
