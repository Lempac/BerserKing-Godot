extends Node

class_name WaveGenerator

##Is generator running?
@export var is_running = false
##Waves to use.
@export var wave_data : WaveResource
##Entity to lock on the generation(spawn tilemap in it parent).
@export var lock_to_generator : Generator
##List of entities. 
@export var entities := {}
##Spawn area
@export var spawn_area : Vector2i
##witdh <; witdh >; hight ^; hight v;
@export var range := Vector4i(0,0,0,0)

var cooldown = Timer.new()

func _init(wave_data: WaveResource, lock_to_generator: Generator) -> void:
	name = "WaveGenerator"
	self.wave_data = wave_data
	self.lock_to_generator = lock_to_generator
	self.cooldown.one_shot = true
	add_child(self.cooldown)
	Global.wave_generate_inited.emit(self.lock_to_generator)

##Start entity spawning, if not started.
func generate() -> void:
	#if self.is_running:
		#return
	#self.is_running = true
	self.lock_to_generator.tilemap.tree_exiting.connect(queue_free)
	#while self.is_running:
	self.cooldown.start(self.wave_data.wave_spawn_cooldown)
	for wave_entry in self.wave_data.wave_enteries:
		for i in range(wave_entry.amount):
			await self.cooldown.timeout
			self.spawn_area = DisplayServer.window_get_size()/2
			var entity = Entity.new(wave_entry.entity)
			entity.position = get_position(self.lock_to_generator.lock_to_entity)
			add_child(entity)
			self.cooldown.start(self.wave_data.wave_spawn_cooldown)
	#self.is_running = self.lock_to_generator.is_running
	Global.wave_generate_stopped.emit(self.lock_to_generator)

##
func get_position(lock_entity: CharacterBody2D) -> Vector2i:
	var position_x = randi_range(-(self.spawn_area.x+self.range.x), self.spawn_area.x+self.range.y)
	var position_y = randi_range(-(self.spawn_area.y+self.range.w), self.spawn_area.y+self.range.z)
	if position_x < self.spawn_area.x and position_x > -self.spawn_area.x:
		if position_y <= 0:
			position_y = maxi(-self.spawn_area.y, position_y)
		else:
			position_y = maxi(self.spawn_area.y, position_y)
	return Vector2i(position_x, position_y) + Vector2i(lock_entity.position)

##Stops the generator, returns if stopped.
#func stop() -> bool:
	#if not self.is_running:
		#return false
	#self.is_running = false
	#return true
