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

func _init(wave_data: WaveResource, lock_to_generator: Generator) -> void:
	self.wave_data = wave_data
	self.lock_to_generator = lock_to_generator
	Global.wave_generate_inited.emit(lock_to_generator)
	
func generate() -> void:
	if is_running:
		return
	is_running = true
	lock_to_generator.tilemap.tree_exiting.connect(func(): is_running = false)
	while is_running:
		is_running = lock_to_generator.is_running
		await lock_to_generator.tilemap.get_tree().process_frame
	Global.wave_generate_stopped.emit(lock_to_generator)
		
##Stops the generator, returns if stopped.
func stop() -> bool:
	if not is_running:
		return false
	is_running = false
	return true
