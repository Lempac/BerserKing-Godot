extends Entity

class_name Player

@export var inventory : Inventory
@export var camera : Camera2D

class PlayerController extends Controller:
	func _process(delta):
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
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
	add_child(self.camera)
	add_child(self.inventory)
	Global.CurrentPlayer = self
