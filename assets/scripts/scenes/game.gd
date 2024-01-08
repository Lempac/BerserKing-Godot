extends Node
var level_generator : LevelGenerator
var wave_generator : WaveGenerator
var item_generator : ItemGenerator

func _ready():
	add_child(load(Global.GameUIScene).instantiate())
	var player = Player.new(load("res://data/entities/player.tres"))
	add_child(player)
	self.level_generator = LevelGenerator.new(Global.CurrentLevel, Global.CurrentPlayer)
	self.level_generator.load_range = 2
	self.level_generator.generate()
	self.wave_generator = WaveGenerator.new(load("res://data/waves/basic.tres"), Global.CurrentPlayer)
	add_child(self.wave_generator)
	self.wave_generator.generate()
	self.item_generator = ItemGenerator.new([load("res://data/items/chest.tres")])
	add_child(self.item_generator)
	self.item_generator.generate()
