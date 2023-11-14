extends Node
@export var generator : Generator
var player

func _ready():
	player = Player.new(load("res://Data/Entities/player.tres"))
	add_child(player)
	Global.CurrentPlayer = player
	generator = Generator.new(Global.CurrentLevel, Global.CurrentPlayer)
	generator.generate()
	
