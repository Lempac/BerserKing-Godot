extends Node
@export var generator : Generator
@export var wave_generator : WaveGenerator
@export var player : Player

func _ready():
	add_child(load(Global.GameUIScene).instantiate())
	player = Player.new(load("res://data/entities/player.tres"))
	add_child(player)
	Global.CurrentPlayer = player
	generator = Generator.new(Global.CurrentLevel, [load("res://data/items/chest.tres")], Global.CurrentPlayer)
	generator.range = 2
	generator.generate()
	#wave_generator = WaveGenerator.new(load("res://Data/Waves/basic.tres"), generator)
	#wave_generator.generate()
	for x in range(10):
		await get_tree().create_timer(2).timeout
		add_child(Entity.new(load("res://data/entities/worm.tres")))
