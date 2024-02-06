extends Panel

var path = "res://assets/objects/items/"

var loop_len = 15
var timer_offset = 1.6

func load_items():
	var items = []
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			break
		elif !file_name.begins_with("."):
			items.append(load(path + "/" + file_name).instantiate())
	dir.list_dir_end()
	return items

func show_menu():
	if Global.CurrentGameUI.has_menu:
		return false
	else:
		Global.CurrentGameUI.has_menu = true
	Global.CurrentGameUI.add_child(self)
	get_tree().paused = true
	var items = load_items()
	if items.size() == 0:
		queue_free()
		return true
	var textures = items.map(func(x):
		return x.get_node("Sprite2D").texture
	)
	var inx = 0
	for i in range(1, loop_len):
		inx = randi_range(0, items.size()-1)
		$MarginContainer/VBoxContainer/Image.texture = textures.pick_random()
		await get_tree().create_timer(i/(loop_len*timer_offset)).timeout
	$MarginContainer/VBoxContainer/State.text = "You got..."
	var name = items[inx].item_name
	$MarginContainer/VBoxContainer/Image.texture = textures[inx]
	$MarginContainer/VBoxContainer/Name.text = name
	$MarginContainer/VBoxContainer/OkButton.disabled = false
	return true

func _on_ok_button_pressed() -> void:
	get_tree().paused = false
	Global.CurrentGameUI.has_menu = false
	Global.CurrentGameUI.inventory.add_slot($MarginContainer/VBoxContainer/Image.texture, $MarginContainer/VBoxContainer/Name.text)
	queue_free()
