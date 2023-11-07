extends Node

@export var PlayerData : EntityResource

func _ready():
#	var player : Area2D = load(Global.Entity).instantiate()
#	player.set_script(PlayerData.logic)
#	add_child(player)
#	var cam = Camera2D.new()
#	add_child(load(Global.GameUIScene).instantiate())
#	player.add_child(cam)
#	Global.CurrentPlayer = player
	Global.Generate()
