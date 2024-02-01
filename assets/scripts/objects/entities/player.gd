extends CharacterBody2D

@export var speed : int

@export var drag : float

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
		velocity = clamp(velocity * drag, Vector2.ZERO, velocity) 
	else:
		velocity = new_velocity.normalized() * speed
	move_and_slide()
