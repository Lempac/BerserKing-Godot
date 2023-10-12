extends Control

@export var Title : Label
@export var Text : String

func _ready():
	Title.text = Text
