extends CharacterBody2D

class_name Controller
@export var speed : int

@warning_ignore("shadowed_variable")
func _init(speed : int) -> void:
	self.speed = speed
	
func _physics_process(_delta: float) -> void:
	var parent : Node2D = get_parent()
	if Global.CurrentPlayer != null:
		velocity = (Global.CurrentPlayer.position - parent.position).normalized() * self.speed
	parent.position = position
	if move_and_slide():
		self.collision(parent)
	
func collision(parent):
	var last_collision = get_last_slide_collision()
	if last_collision != null:
		Global.controller_touch.emit(parent, last_collision.get_collider().get_parent() as Entity)
