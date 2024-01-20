extends Node
class_name Health
@export var health : int
@export var max_health : int
@export var health_regenerate : int

var cooldown_take_damage := Timer.new()
var cooldown_heal := Timer.new()

func take_damage(damage : int):
	self.health-=damage
	#print(get_parent().name + " took " +str(damage)+ " damage")
	Global.health_took_damage.emit(self)
	if self.health <= 0:
		get_parent().despawn()
		Global.health_killed.emit(get_parent())
	
@warning_ignore("shadowed_variable")
func _init(max_health : int, health : int, health_regenerate : int = 0):
	name = "Health"
	self.cooldown_take_damage.name = "cooldown_take_damage"
	self.cooldown_heal.name = "cooldown_heal"
	self.cooldown_take_damage.one_shot = true
	self.cooldown_heal.one_shot = true
	add_child(self.cooldown_take_damage)
	add_child(self.cooldown_heal)
	self.health = health
	self.max_health = max_health
	self.health_regenerate = health_regenerate
	Global.controller_touch.connect(on_touch)
	
func on_touch(game_objct : GameObject, other : GameObject):
	if not other is Entity:
		return
	if self.cooldown_take_damage.time_left == 0:
		if game_objct == get_parent() and (other == Global.CurrentPlayer or game_objct == Global.CurrentPlayer):
			take_damage(other.damage)
			self.cooldown_take_damage.start(0.1)

func _process(_delta: float) -> void:
	if self.cooldown_heal.time_left == 0:
		self.health=mini(self.health+self.health_regenerate, self.max_health)
		self.cooldown_heal.start(1)
