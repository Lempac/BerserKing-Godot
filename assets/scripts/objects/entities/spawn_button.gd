extends Button

@export_file() var item

func _ready() -> void:
	text = load(item).instantiate().name

func _on_pressed() -> void:
	if get_child_count() > 0:
		var positions = get_children().map(func(x): return x.global_position)
		for pos in positions:
			var new_item = load(item).instantiate()
			add_sibling(new_item)
			new_item.global_position = pos
