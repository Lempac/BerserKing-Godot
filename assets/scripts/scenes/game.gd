extends Node

func _ready():
	add_child(load(Global.GameUIScene).instantiate())
	add_child(Global.CurrentLevel)
