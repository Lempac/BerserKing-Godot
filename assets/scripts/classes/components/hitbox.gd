extends CharacterBody2D

class_name Hitbox

@export var shape : CollisionShape2D

@warning_ignore("shadowed_variable")
func _init(shape : Shape2D, size : Vector2) -> void:
	name = "Hitbox"
	self.shape = CollisionShape2D.new()
	add_child(self.shape)
	self.shape.shape = shape
	var current_shape = self.shape.shape
	if current_shape is CircleShape2D:
		current_shape.radius = size.x / 2.0 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_width() / 2.0
	elif current_shape is RectangleShape2D:
		current_shape.size = size / 2 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_size() / 2
	elif current_shape is CapsuleShape2D:
		current_shape.radius = size.x / 2 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_width() / 2.0
		current_shape.height = size.y / 2 #data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_height() / 2.0

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	var parent : GameObject = get_parent()
	if move_and_slide():
		var last_collision = get_last_slide_collision()
		if last_collision != null:
			Global.controller_touch.emit(parent, last_collision.get_collider().get_parent())
