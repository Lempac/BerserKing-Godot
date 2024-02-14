extends Node2D

@export var range : int
@export var fire_speed : int = 1
@onready var anim = $AnimationPlayer

var target : Node2D
var arrow : Area2D = load("res://assets/objects/weapons/bow/arrow.tscn").instantiate()
var charged = false
var shoot : Callable
var rot = 0

func _ready() -> void:
	anim.speed_scale = fire_speed

func get_target():
	var enemies : Array[Node] = get_node("/root/Game/Enemies").get_children()
	if enemies.size() == 0:
		return
	var positions = enemies.map(func(x): return x.global_position)
	var distances = positions.map(func(pos): return Global.CurrentPlayer.global_position.distance_to(pos))
	var small_dis = distances.min()
	if range > small_dis:
		target = enemies[distances.find(small_dis)]

func _process(delta: float) -> void:
	if target == null or target.global_position.distance_to(global_position) > range:
		get_target()
	elif charged == false and !anim.is_playing():
		anim.play("charge")
	elif charged == true:
		shoot.call(0.1)
		anim.play("RESET")
		charged = false
	rot = wrap(rot+0.3 * delta, -360, 360)
	position = Vector2(50, 0).rotated(rot)
	if target != null:
		rotation = global_position.angle_to_point(target.global_position)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "charge":
		var new_arrow = arrow.duplicate()
		new_arrow.position = Vector2(1, 0)
		shoot = new_arrow.shoot
		add_child(new_arrow)
		charged = true
