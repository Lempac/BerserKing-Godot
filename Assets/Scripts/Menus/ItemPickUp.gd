extends Control

@onready var ImageElement = $Panel/HBoxContainer/VBoxContainer/Image
@onready var TextElement = $Panel/HBoxContainer/VBoxContainer/Text

@export var ImagePath = ""
@export var Text = ""

func _ready():
	ImageElement.texture = Image.load_from_file(ImagePath)
	TextElement.text = Text

func _on_button_pressed():
	pass # Replace with function body.
