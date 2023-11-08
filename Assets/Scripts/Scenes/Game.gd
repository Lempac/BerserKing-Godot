extends Node
@export var generator : Generator
@export var PlayerData : EntityResource

func _ready():
	Global.CurrentPlayer = $Player
	generator = Generator.new(Global.CurrentLevel, Global.CurrentPlayer)
