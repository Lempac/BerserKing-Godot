extends AnimatedSprite2D

class_name SpriteAnim

@warning_ignore("shadowed_variable_base_class")
func _init(sprite_frames : SpriteFrames) -> void:
	name = "SpriteAnim"
	self.sprite_frames = sprite_frames
