extends Entity
class_name Player

@export var inventory : Inventory
@export var camera : Camera2D
@export var ninja_bullet : NBullet
@export var collision : CollisionShape2D
@export var sprite : Sprite2D
@export var timer : Timer

var speed = 100

class PlayerController extends Controller:
	func _process(delta):
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
			get_parent().sprite_anim.flip_h = false
			get_parent().ninja_bullet.position.x = 28
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
			get_parent().sprite_anim.flip_h = true
			get_parent().ninja_bullet.position.x = -28
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1
		if velocity.length() > 0:
			velocity = velocity.normalized() * self.speed
		var parent : Entity = get_parent()
		parent.velocity = velocity
		parent.move_and_slide()
		self.collision(parent)



func _init(data : EntityResource, do_spawning := true) -> void:
	super._init(data, do_spawning)
	remove_child(self.controller)
	self.controller = PlayerController.new(400)
	add_child(self.controller)
	self.camera = Camera2D.new()
	self.inventory = Inventory.new(4)
	self.ninja_bullet = Node2D.new()
	self.collision = CollisionShape2D.new()
	self.sprite = Sprite2D.new()
	self.timer = Timer.new()
	self.ninja_bullet = NBullet.new()
	add_child(self.camera)
	add_child(self.inventory)
	add_child(self.ninja_bullet)
	self.ninja_bullet.add_child(self.collision)
	self.ninja_bullet.add_child(self.sprite)
	self.ninja_bullet.add_child(self.timer)
	
	Global.CurrentPlayer = self
	

#ninja_bullet settings
	self.sprite.texture = preload("res://assets/textures/sprites/tile000_3.png")
	self.ninja_bullet.position.x = 28
	var rectangle_shape = RectangleShape2D.new()
	self.collision.shape = rectangle_shape
