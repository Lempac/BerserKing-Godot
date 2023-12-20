extends Resource

class_name GameObjectResource

@export var name : String
@export var sprite_frames : SpriteFrames
@export var shape : Shape2D
	
func _init(name : String = "", sprite_frames : SpriteFrames = null, shape : Shape2D = null) -> void:
	self.name = name
	self.sprite_frames = sprite_frames
	self.shape = shape
