extends Entity

class_name Player

@export var inventory : Inventory
@export var camera : Camera2D

class PlayerController extends Controller:
	func _physics_process(_delta: float) -> void:
		var velocity = Vector2(int(Input.is_action_pressed("move_right"))-int(Input.is_action_pressed("move_left")),
		 int(Input.is_action_pressed("move_down"))-int(Input.is_action_pressed("move_up")))
		if velocity.length() > 0:
			velocity = velocity.normalized() * self.speed
		var parent : Entity = get_parent()
		parent.hitbox.velocity = velocity

func _init(data : EntityResource) -> void:
	super._init(data)
	remove_child(self.controller)
	self.controller = PlayerController.new(400)
	add_child(self.controller)
	#self.hitbox.reparent(self.controller)
	#self.sprite_anim.reparent(self.controller)
	self.camera = Camera2D.new()
	self.inventory = Inventory.new(4)
	add_child(self.camera)
	#self.controller.add_child(self.camera)
	add_child(self.inventory)
	Global.CurrentPlayer = self

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if hitbox:
		self.camera.position = self.hitbox.position
