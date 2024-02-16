extends GameObjectResource

class_name EntityResource
@export var damage : int
@export var health : int
@export var max_health : int
## Per second
@export var health_regenerate : int 

func _init(name : String = "", health : int = 0, max_health : int = 0, health_regenerate : int = 0, damage : int = 0, sprite_frames : SpriteFrames = null, shape : Shape2D = null) -> void:
	super._init(name, sprite_frames, shape)
	self.damage = damage
	self.health = health
	self.max_health = max_health
	self.health_regenerate = health_regenerate
	
