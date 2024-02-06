extends Panel

@export var item_name : String

@onready var image := $TextureRect
@onready var count := $Count

func _ready() -> void:
	add()

func add():
	count.text = str(int(count.text) + 1)
