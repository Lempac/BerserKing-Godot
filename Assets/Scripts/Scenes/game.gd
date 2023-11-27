extends Node
@export var generator : Generator
@export var wave_generator : WaveGenerator
var player

func _ready():
	add_child(load(Global.GameUIScene).instantiate())
	player = Player.new(load("res://Data/Entities/player.tres"))
	add_child(player)
	Global.CurrentPlayer = player
	generator = Generator.new(Global.CurrentLevel, [load("res://Data/Items/chest.tres")], Global.CurrentPlayer)
	generator.range = 2
	generator.generate()
	wave_generator = WaveGenerator.new(load("res://Data/Waves/basic.tres"), generator)
	wave_generator.generate()
	
	
