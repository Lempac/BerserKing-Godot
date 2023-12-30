extends Item

class_name Weapon

func _init(data : WeaponResource, do_spawning := true) -> void:
	super._init(data as ItemResource, do_spawning)
	
