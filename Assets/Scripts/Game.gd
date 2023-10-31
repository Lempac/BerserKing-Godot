extends Node

@export var PlayerData : Entity_Resource

func _ready():
	var levelData : Camera2D = load(Global.CurrentLevel).instantiate()
	var player : Area2D = load(Global.Entity).instantiate()
	#player.get_node("CollisionShape2D").collider_shape = PlayerData.shape
	player.set_script(PlayerData.logic)
	self.add_child(player)
	self.add_child(levelData.get_child(0).duplicate())
	var cam = Camera2D.new()
	player.add_child(cam)
	
func Gen():
	pass
