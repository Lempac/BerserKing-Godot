extends CharacterBody2D

@export var speed : int
@export var health : int
@export var damage : int

func _ready() -> void:
	$AnimatedSprite2D.play("run")

func _process(delta: float) -> void:
	velocity = (Global.CurrentPlayer.position - position).normalized() * speed
	if move_and_slide():
		var last_touch = get_last_slide_collision()
		if last_touch != null:
			var other = last_touch.get_collider()
			if other.name == "Player" and other.health:
				other.health -= damage
				
	$AnimatedSprite2D.flip_h = velocity.x < 0
	
	if health <= 0:
		Global.CurrentGameKillCount += 1
		queue_free()
	
	if Global.despawn_distance < Global.CurrentPlayer.position.distance_to(position):
		queue_free()
