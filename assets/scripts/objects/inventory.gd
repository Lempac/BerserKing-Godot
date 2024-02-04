extends GridContainer

@export var slot : PackedScene

@export var size_inv : int

func _ready() -> void:
	columns = size_inv

func add_slot(sprite_f : SpriteFrames):
	if get_child_count() == size_inv:
		return
	var new_slot = slot.instantiate()
	add_child(new_slot)
