extends Node

#Variables
@export_file var PlayScene := "res://Scenes/Levels.tscn"
@export_file var OptionsScene := "res://Scenes/OptionsMenu.tscn"
@export_file var MainMenuScene := "res://Scenes/MainMenu.tscn"
@export_file var GameScene := "res://Scenes/Game.tscn"
@export_file var GameUIScene := "res://Scenes/GameUI.tscn"
@export var CurrentLevel : LevelTileMap
@export var CurrentPlayer : Area2D
@export_file var Entity := "res://Assets/Objects/Entity.tscn"
@export_file var LevelTiles := "res://Data/LevelTiles.tscn"

#Signals
signal GenerateInit(LevelData : LevelTileMap, LockToEntity : Area2D)
signal GenerateOnNewLoad(Position : Vector2i, Tile : LevelTileMap.Tile)
signal GenerateOnLoad(Position : Vector2i, Tile : LevelTileMap.Tile)
signal GenerateOnUnload(Position : Vector2i, Tile : LevelTileMap.Tile)
signal GenerateStopped(LevelData : LevelTileMap, LockToEntity : Area2D)

func Generate(Level := CurrentLevel, LockToEntity := CurrentPlayer) -> void:
	if Level == null or LockToEntity == null:
		return
	GenerateInit.emit(Level, LockToEntity)
	while true:
		
		await get_tree().process_frame

