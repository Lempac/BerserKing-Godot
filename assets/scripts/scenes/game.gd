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
	self.item_generator = ItemGenerator.new([load("res://data/items/chest.tres"), load("res://data/items/weapons/ninja_star.tres")])
	add_child(self.item_generator)
	self.item_generator.generate()
	var chest = Item.new(load("res://data/items/chest.tres"))
	chest.hitbox.position += Vector2(20,0)
	var ninja_star = Weapon.new(load("res://data/items/weapons/ninja_star.tres"))
	ninja_star.hitbox.position += Vector2(50,0)
	add_child(chest)
	add_child(ninja_star)
