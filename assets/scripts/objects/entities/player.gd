extends CharacterBody2D

@export var speed : int
@export var drag : float
@export var health : int
@export var max_health : int
@export var regen : int
@export var touch_damage : int

func _ready() -> void:
	Global.CurrentPlayer = self

func _process(delta: float) -> void:
	var new_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		new_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		new_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		new_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		new_velocity.y -= 1
	
	if new_velocity.length() == 0:
		velocity = velocity * drag
	else:
		velocity = new_velocity.normalized() * speed
	if move_and_slide():
		var last_touch = get_last_slide_collision()
		if last_touch != null:
			var other = last_touch.get_collider()
			if "health" in other:
				other.health -= touch_damage
	
	if health <= 0:
		queue_free()
	if health < max_health:
		health = max(max_health, health+regen)
