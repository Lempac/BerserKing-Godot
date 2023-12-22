extends Node

class_name WaveGenerator

##Is generator running?
@export var is_running = false
##Waves to use.
@export var wave_data : Array[WaveResource]
##Entity to lock on the generation(spawn tilemap in it parent).
@export var lock_to_generator : Generator
##List of entities. 
@export var entities := {}
##
@export var spawn_area : Vector2i
##witdh <, witdh >, hight ^, hight v
@export var range := Vector4i(100,100,100,100)

func _init(wave_data: Array[WaveResource], lock_to_generator: Generator) -> void:
	self.wave_data = wave_data
	self.lock_to_generator = lock_to_generator
	Global.wave_generate_inited.emit(lock_to_generator)

##
func generate() -> void:
	if self.is_running:
		return
	self.is_running = true
	self.lock_to_generator.tilemap.tree_exiting.connect(func(): is_running = false)
	while self.is_running:
		self.spawn_area = DisplayServer.window_get_size() / 2
		var lock_entity = self.lock_to_generator.lock_to_entity 
		var start_position = lock_entity.get_viewport().get_camera_2d().get_screen_center_position()
		var position_x = randi_range(-(self.spawn_area.x+self.range.x), self.spawn_area.x+self.range.y)
		var position_y = randi_range(-(self.spawn_area.y+self.range.w), self.spawn_area.y+self.range.z)
		if position_x < self.spawn_area.x or position_x > -self.spawn_area.x:
			if position_y <= 0:
				position_y = maxi(-self.spawn_area.y, position_y)
			else:
				position_y = maxi(self.spawn_area.y, position_y)
		
		await self.lock_to_generator.tilemap.get_tree().process_frame
		self.is_running = self.lock_to_generator.is_running
	Global.wave_generate_stopped.emit(self.lock_to_generator)

##
#func add(wave_data : WaveResource) -> void:

##Stops the generator, returns if stopped.
func stop() -> bool:
	if not self.is_running:
		return false
	self.is_running = false
	return true
