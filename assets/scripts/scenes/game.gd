extends Node
@export var generator : Generator
@export var wave_generator : WaveGenerator

func _ready():
	add_child(load(Global.GameUIScene).instantiate())
	var player = Player.new(load("res://data/entities/player.tres"))
	add_child(player)
	self.generator = Generator.new(Global.CurrentLevel, [load("res://data/items/chest.tres")], Global.CurrentPlayer)
	self.generator.range = 2
	self.generator.generate()
	self.wave_generator = WaveGenerator.new([load("res://data/waves/basic.tres")], self.generator)
	self.wave_generator.generate()
