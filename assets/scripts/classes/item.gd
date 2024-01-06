extends GameObject

class_name Item

func _init(data : ItemResource) -> void:
	super._init(data)
	
func pick_up():
	Global.item_picked_up.emit(self)
