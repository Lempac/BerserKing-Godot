extends Node2D

@onready var shuriken_bullet = "res://assets/scripts/objects/weapons/shuriken/shuriken_bullet.tscn"
@export var fire_rate : float
@export var distance : int = 100


func _ready():
	$SpawnTimer.wait_time = fire_rate



func _on_spawn_timer_timeout():
	var new_bullet = load(shuriken_bullet).instantiate()
	get_parent().add_sibling(new_bullet)
	new_bullet.position = global_position
	new_bullet.shoot()
	
	
func _process(delta: float) -> void:
	if Global.CurrentPlayer.global_position.distance_to(global_position) > distance:
		queue_free()

