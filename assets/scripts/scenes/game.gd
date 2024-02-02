extends Node

@export var spawn_rate : float
@export var spawn_offset : Vector2i

var worm = load("res://assets/objects/entities/worm.tscn")

func _ready():
	add_child(load(Global.GameUIScene).instantiate())
	add_child(Global.CurrentLevel)
	$SpawnTimer.wait_time = spawn_rate
	
	
func spawn():
	var new_enemy : CharacterBody2D = worm.instantiate()
	var size = DisplayServer.window_get_size() / 2 + spawn_offset
	var player_pos = Global.CurrentPlayer.position
	var new_pos = Vector2(randi_range(player_pos.x - size.x, player_pos.x + size.x), randi_range(player_pos.y - size.y, player_pos.y + size.y))
	if new_pos.x < player_pos.x + size.x and new_pos.x >  player_pos.x - size.x:
		new_pos.y = max(new_pos.y, player_pos.y + size.y) if new_pos.y > player_pos.y else min(new_pos.y, player_pos.y - size.y)
	new_enemy.position = new_pos 
	add_child(new_enemy)
	


func _on_spawn_timer_timeout() -> void:
	spawn()
