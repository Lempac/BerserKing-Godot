extends CollisionShape2D

class_name Hitbox

@warning_ignore("shadowed_variable_base_class")
func _init(shape : Shape2D, size : Vector2) -> void:
	self.shape = shape
	if self.shape is CircleShape2D:
		self.shape.radius = size.x / 2.0 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_width() / 2.0
	elif self.shape is RectangleShape2D:
		self.shape.size = size / 2 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_size() / 2
	elif self.shape is CapsuleShape2D:
		self.shape.radius = size.x / 2 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_width() / 2.0
		self.shape.height = size.y / 2 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_height() / 2.0
