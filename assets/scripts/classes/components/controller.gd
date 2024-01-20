extends Node

class_name Controller
@export var speed : int

@warning_ignore("shadowed_variable")
func _init(speed : int) -> void:
	name = "Controller"
	self.speed = speed
	
func _physics_process(_delta: float) -> void:
	var parent : GameObject = get_parent()
	if not parent.hitbox:
		return
	if Global.CurrentPlayer != null:
		parent.hitbox.velocity = (Global.CurrentPlayer.hitbox.position - parent.hitbox.position).normalized() * self.speed
