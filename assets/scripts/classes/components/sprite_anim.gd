extends AnimatedSprite2D

class_name SpriteAnim

@warning_ignore("shadowed_variable_base_class")
func _init(sprite_frames : SpriteFrames) -> void:
	name = "SpriteAnim"
	self.sprite_frames = sprite_frames
	hide()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	show()
	var parent = get_parent()
	if parent.hitbox:
		position = parent.hitbox.position
