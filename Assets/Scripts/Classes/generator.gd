extends Node

class_name Generator

func _init(level_data : LevelTileMap, lock_to_entity : Area2D) -> void:
	if level_data == null or lock_to_entity == null:
		return
	Global.generate_inited.emit(level_data, lock_to_entity)

#func Generate(Parent : Node, Level := CurrentLevel, LockToEntity := CurrentPlayer) -> Callable:
#	if Level == null or LockToEntity == null:
#		return _stop.bind(false, false)
#	var index : bool
#	var tilemap = TileMap.new()
#	for layer in Level.get_layers_count():
#		tilemap.add_layer(layer)
#	Parent.add_child(tilemap)
#	GenerateInit.emit(Level, LockToEntity)
#	while index:
##		var Position = LockToEntity.position / Level.TileSize
##
##		Level.Tiles
#		await get_tree().process_frame
