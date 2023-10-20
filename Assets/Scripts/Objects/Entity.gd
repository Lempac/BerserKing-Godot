extends Area2D
@export var ColliderShape : Shape2D

func _ready():
	$CollisionShape2D.shape = ColliderShape
