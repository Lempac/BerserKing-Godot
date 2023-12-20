extends Node
var player

func  _init() -> void:
	add_child(load(Global.GameUIScene).instantiate())
	player = Player.new(load("res://data/entities/player.tres"))
	add_child(player)
	Global.CurrentPlayer = player
