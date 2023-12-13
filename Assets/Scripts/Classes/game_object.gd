extends CharacterBody2D

class_name GameObject
@export var data : GameObjectResource
@export var sprite_anim : AnimatedSprite2D
@export var collision_shape : CollisionShape2D

func _init(data : GameObjectResource, do_spawning := true) -> void:
	self.data = data
	if do_spawning: spawn()
	
func spawn():
	name = data.name
	sprite_anim = AnimatedSprite2D.new()
	sprite_anim.sprite_frames = data.sprite_frames
	add_child(sprite_anim)
	collision_shape = CollisionShape2D.new()
	collision_shape.shape = data.shape
	if data.shape is CircleShape2D:
		collision_shape.shape.radius = data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_width() / 2
	elif data.shape is RectangleShape2D:
		collision_shape.shape.size = data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_size() / 2
	elif data.shape is CapsuleShape2D:
		collision_shape.shape.radius = data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_width() / 2
		collision_shape.shape.height = data.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_height() / 2
	add_child(collision_shape)
	Global.object_spawned.emit(data)

func despawn():
	queue_free()
	Global.object_despawned.emit(data)
	
