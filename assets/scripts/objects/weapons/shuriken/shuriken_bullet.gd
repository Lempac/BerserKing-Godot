
extends Area2D

var speed = 100
var damage = 100

func _physics_process(delta):
	self.position.x += self.transform.x.normalized().x * speed * delta

func shoot():
	process_mode = Node.PROCESS_MODE_INHERIT


func _on_body_entered(body: Node2D) -> void:
	if body != Global.CurrentPlayer and "health" in body:
		body.health -= damage
		queue_free()
	
	
