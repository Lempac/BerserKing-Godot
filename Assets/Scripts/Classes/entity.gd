extends GameObject

class_name Entity

func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data as GameObjectResource, do_spawning)
