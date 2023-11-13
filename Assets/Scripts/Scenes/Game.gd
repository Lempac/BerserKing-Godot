extends Node
var generator : Generator

func _ready():
	Global.CurrentPlayer = $Player
	generator = Generator.new(Global.CurrentLevel, Global.CurrentPlayer)
	generator.generate()
