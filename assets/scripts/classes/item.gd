extends GameObject

class_name Item

func _init(data : ItemResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)

func spawn():
	super.spawn()
