extends GridContainer

@export var slot : PackedScene

@export var size_inv : int

func _ready() -> void:
	columns = size_inv

func add_slot(texture : Texture):
	if get_child_count() == size_inv:
		return
	var new_slot = slot.instantiate()
	new_slot.image.texture = texture
	add_child(new_slot)
