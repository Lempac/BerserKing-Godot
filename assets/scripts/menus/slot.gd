extends Panel

@export var item_name : String

@onready var image := $TextureRect
@onready var count := $Count

func _ready() -> void:
	add()

func add():
	count.text = str(int(count.text) + 1)

func _on_texture_rect_item_rect_changed() -> void:
	if item_name == "Glock 17" and image.scale != Vector2(0.2, 0.2):
		image.scale = Vector2(0.2, 0.2)
		image.position = Vector2(10, 10)
