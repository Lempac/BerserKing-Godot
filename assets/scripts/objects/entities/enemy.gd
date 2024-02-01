extends CharacterBody2D

@export var speed : int

func _process(delta: float) -> void:
	velocity = (Global.CurrentPlayer.position - position).normalized() * speed
	move_and_slide()
