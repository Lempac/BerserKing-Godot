extends Resource

class_name WaveResource

@export_enum(
	"On loaded:generate_on_loaded",
	"On wave spawned:wave_generate_on_spawned"
) var start_event_string : String
@export var wave_enteries : Array[WaveEntryResource]
