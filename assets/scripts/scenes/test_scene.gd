extends Node
var player

func  _init() -> void:
	add_child(load(Global.GameUIScene).instantiate())
