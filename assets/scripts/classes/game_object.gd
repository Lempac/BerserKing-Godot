extends Node

class_name GameObject
@export var sprite_anim : SpriteAnim
@export var hitbox : Hitbox

func _init(data : GameObjectResource) -> void:
	name = data.name
	self.sprite_anim = SpriteAnim.new(data.sprite_frames)
	self.hitbox = Hitbox.new(data.shape, self.sprite_anim.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_size())
	add_child(self.sprite_anim)
	add_child(self.hitbox)
	tree_entered.connect(func(): Global.object_spawned.emit(self), CONNECT_ONE_SHOT)

func despawn() -> void:
	process_mode=Node.PROCESS_MODE_DISABLED
	queue_free()
	Global.object_despawned.emit(self)
	
