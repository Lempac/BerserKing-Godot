extends Area2D

class_name Controller
@export var speed : int

func _init(speed := 100) -> void:
	self.speed = speed
	
func _process(delta: float) -> void:
	var parent = get_parent() 
	parent.velocity = (Global.CurrentPlayer.position - parent.position).normalized() * speed
	parent.move_and_slide()
	
func _enter_tree() -> void:
	area_entered.connect(func(other : Controller): Global.controller_touch.emit(get_parent() , other.get_parent()))
