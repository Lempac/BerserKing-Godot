extends Area2D

class_name Controller
@export var speed : int
var parent : CharacterBody2D

func _init(parent: CharacterBody2D, speed := 100) -> void:
	self.parent = parent
	self.speed = speed
	area_entered.connect(func(other : Controller): Global.controller_touch.emit(parent, other.parent))

func _process(delta: float) -> void:
	parent.velocity = (Global.CurrentPlayer.position - parent.position).normalized() * speed
	parent.move_and_slide()
	
