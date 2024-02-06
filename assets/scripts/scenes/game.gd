extends Node

@export var spawn_rate : float
@export var spawn_offset : Vector2i

var enemies_path = "res://assets/objects/entities/enemies/"
var enemies = []

func load_enemies():
	var enemies = []
	var dir = DirAccess.open(enemies_path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			break
		elif !file_name.begins_with("."):
			enemies.append(load(enemies_path + "/" + file_name).instantiate())
	dir.list_dir_end()
	return enemies

func _ready():
	add_child(Global.CurrentLevel)
	enemies = load_enemies()
	$SpawnTimer.wait_time = spawn_rate
	
func spawn():
	var new_enemy = enemies.pick_random().duplicate()
	var size = DisplayServer.window_get_size() / 2 + spawn_offset
	var player_pos = Global.CurrentPlayer.position
	var new_pos = Vector2(randi_range(player_pos.x - size.x, player_pos.x + size.x), randi_range(player_pos.y - size.y, player_pos.y + size.y))
	if new_pos.x < player_pos.x + size.x and new_pos.x >  player_pos.x - size.x:
		new_pos.y = max(new_pos.y, player_pos.y + size.y) if new_pos.y > player_pos.y else min(new_pos.y, player_pos.y - size.y)
	new_enemy.position = new_pos 
	add_child(new_enemy)
	


func _on_spawn_timer_timeout() -> void:
	spawn()
