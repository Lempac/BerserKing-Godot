extends Node2D

class_name NBullet

var speed = 100

func _process(delta):
	nbullet(delta)

func nbullet(delta):
	self.position.x += self.transform.x.normalized().x * speed * delta

