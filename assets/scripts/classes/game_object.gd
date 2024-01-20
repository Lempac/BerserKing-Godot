extends Node

class_name GameObject
@export var sprite_anim : SpriteAnim


func _init(data : GameObjectResource) -> void:
	name = data.name
	self.sprite_anim = SpriteAnim.new(data.sprite_frames)
	add_child(self.sprite_anim)
	tree_entered.connect(func(): Global.object_spawned.emit(self), CONNECT_ONE_SHOT)

func despawn() -> void:
	process_mode=Node.PROCESS_MODE_DISABLED
	queue_free()
	Global.object_despawned.emit(self)
	
