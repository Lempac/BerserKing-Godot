extends Node

class_name WaveGenerator

##Is generator running?
@export var is_running = false
##Waves to use.
@export var wave_data : WaveResource
##Entity to lock on the generation(spawn tilemap in it parent).
@export var lock_to_entity : Entity
##List of entities. 
@export var entities : Array[Entity] = []
##Spawn area
@export var spawn_area : Vector2i
##witdh <; witdh >; hight ^; hight v;
@export var spawn_range := Vector4i(0,0,0,0)

var cooldown = Timer.new()

@warning_ignore("shadowed_variable")
func _init(wave_data: WaveResource, lock_to_entity: Entity) -> void:
	name = "WaveGenerator"
	self.wave_data = wave_data
	self.lock_to_entity = lock_to_entity
	self.cooldown.one_shot = true
	add_child(self.cooldown)
	Global.wave_generate_inited.emit(self.wave_data)

##Start entity spawning, if not started.
func generate() -> void:
	#if self.is_running:
		#return
	#self.is_running = true
	self.lock_to_entity.tree_exiting.connect(queue_free)
	#while self.is_running:
	self.cooldown.start(self.wave_data.wave_spawn_cooldown)
	for wave_entry in self.wave_data.wave_enteries:
		for i in range(wave_entry.amount):
			await self.cooldown.timeout
			self.spawn_area = DisplayServer.window_get_size()/2
			var entity = Entity.new(wave_entry.entity)
			entity.hitbox.position = get_position(self.lock_to_entity)
			entities.append(entity)
			add_child(entity)
			self.cooldown.start(self.wave_data.wave_spawn_cooldown)
	Global.wave_generate_stopped.emit(self.wave_data, self.lock_to_entity)

##
func get_position(lock_entity: Entity) -> Vector2i:
	var position_x = randi_range(-(self.spawn_area.x+self.spawn_range.x), self.spawn_area.x+self.spawn_range.y)
	var position_y = randi_range(-(self.spawn_area.y+self.spawn_range.w), self.spawn_area.y+self.spawn_range.z)
	if position_x < self.spawn_area.x and position_x > -self.spawn_area.x:
		if position_y <= 0:
			position_y = maxi(-self.spawn_area.y, position_y)
		else:
			position_y = maxi(self.spawn_area.y, position_y)
	return Vector2i(position_x, position_y) + Vector2i(lock_entity.hitbox.position)

##Stops the generator, returns if stopped.
#func stop() -> bool:
	#if not self.is_running:
		#return false
	#self.is_running = false
	#return true
