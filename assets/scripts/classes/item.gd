extends GameObject

class_name Item
@export var hitbox : StaticHitbox

class StaticHitbox extends StaticBody2D:
	@export var shape : CollisionShape2D
	
	@warning_ignore("shadowed_variable")
	func _init(shape : Shape2D, size : Vector2) -> void:
		name = "Hitbox"
		self.shape = CollisionShape2D.new()
		add_child(self.shape)
		self.shape.shape = shape
		var current_shape = self.shape.shape
		if current_shape is CircleShape2D:
			current_shape.radius = size.x / 2.0
		elif current_shape is RectangleShape2D:
			current_shape.size = size / 2
		elif current_shape is CapsuleShape2D:
			current_shape.radius = size.x / 2
			current_shape.height = size.y / 2

func _init(data : ItemResource) -> void:
	super._init(data)
	self.hitbox = StaticHitbox.new(data.shape, self.sprite_anim.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_size())
	add_child(self.hitbox)

func pick_up():
	Global.item_picked_up.emit(self)
