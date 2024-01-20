extends GameObject

class_name Entity
@export var controller : Controller
@export var health : Health
@export var damage : int
@export var hitbox : Hitbox

func _init(data : EntityResource) -> void:
	super._init(data)
	self.damage = data.damage
	self.controller = Controller.new(data.speed)
	self.health = Health.new(data.max_health, data.health, data.health_regenerate)
	self.hitbox = Hitbox.new(data.shape, self.sprite_anim.sprite_frames.get_frame_texture(data.sprite_frames.get_animation_names()[0], 0).get_size())
	add_child(self.hitbox)
	add_child(self.controller)
	add_child(self.health)
