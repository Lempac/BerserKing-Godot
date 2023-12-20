extends GameObjectResource

class_name EntityResource
@export var damage : int 
func _init(name : String = "", sprite_frames : SpriteFrames = null, shape : Shape2D = null) -> void:
	super._init(name, sprite_frames, shape)
	
