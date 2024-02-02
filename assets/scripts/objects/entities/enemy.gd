extends CharacterBody2D

@export var speed : int
@export var health : int
@export var damage : int

func _process(delta: float) -> void:
	velocity = (Global.CurrentPlayer.position - position).normalized() * speed
	if move_and_slide():
		var last_touch = get_last_slide_collision()
		if last_touch != null:
			var other = last_touch.get_collider()
			if other.name == "Player" and other.health:
				other.health -= damage
	if health <= 0:
		queue_free()
