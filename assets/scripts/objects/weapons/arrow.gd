extends Area2D

@export var speed : int
@export var damage : int

func shoot(offset):
	rotation = rotation + randf_range(-offset, offset)
	reparent(get_parent().get_parent().get_parent())
	process_mode = Node.PROCESS_MODE_INHERIT
	

func _process(delta: float) -> void:
	position += Vector2(1, 0).rotated(rotation) * speed
	if Global.CurrentPlayer.position.distance_to(position) > Global.despawn_distance:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body != Global.CurrentPlayer and "health" in body:
		body.health -= damage
		queue_free()
