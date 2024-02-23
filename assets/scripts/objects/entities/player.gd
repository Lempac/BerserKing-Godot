extends CharacterBody2D


@export var speed : int
@export var drag : float
@export var health : int
@export var max_health : int
@export var regen_every_second : int
@export var touch_damage : int

@onready var roll = $Roll
const roll_speed = 800
const roll_length = 0.7

func _ready() -> void:
	Global.CurrentPlayer = self
	

func _process(delta: float) -> void:
	var animation = $AnimatedSprite2D
	var new_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		new_velocity.x += 1
		animation.flip_h = false
	if Input.is_action_pressed("move_left"):
		new_velocity.x -= 1
		animation.flip_h = true
	if Input.is_action_pressed("move_down"):
		new_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		new_velocity.y -= 1
	if new_velocity.length() != 0 and !roll.IsRolling():
		animation.play("run")
	if not Input.is_anything_pressed():
		animation.play("idle")
	if Input.is_action_pressed("roll"):
		roll.StartRoll(roll_length)
		animation.play("roll")
	
	if new_velocity.length() == 0:
		velocity = velocity * drag
	else:
		velocity = new_velocity.normalized() * (roll_speed if roll.IsRolling() else speed)
	if move_and_slide():
		var last_touch = get_last_slide_collision()
		if last_touch != null:
			var other = last_touch.get_collider()
			if "health" in other:
				other.health -= touch_damage
				animation.play("get_hit")
	if health <= 0:
		animation.play("death")
		load("res://assets/objects/menus/game_over.tscn").instantiate().show_menu()
		queue_free()
		
	


func _on_regen_timeout() -> void:
	if health < max_health:
		health = min(max_health, health+regen_every_second)
		
		




	
