extends GameObject

class_name Item

func _init(data : ItemResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)

func spawn():
	super.spawn()
	area_entered.connect(pick_up)

func pick_up(area: Area2D):
	if len(Global.item_picked_up.get_connections()) == 0:
		queue_free()
	Global.item_picked_up.emit(data)
