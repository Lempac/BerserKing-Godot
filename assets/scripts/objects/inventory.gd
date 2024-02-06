extends GridContainer

@export var slot : PackedScene

@export var size_inv : int

func _ready() -> void:
	columns = size_inv

func add_slot(texture : Texture, item_name : String):
	var pos = check_item_name(item_name)
	if pos != -1:
		get_children()[pos].add()
		return
	if get_child_count() == size_inv:
		return
	var new_slot = slot.instantiate()
	add_child(new_slot)
	new_slot.item_name = item_name
	new_slot.image.texture = texture
	
func check_item_name(item_name : String):
	var names = get_children().map(func(x): return x.item_name)
	return names.find(item_name)
