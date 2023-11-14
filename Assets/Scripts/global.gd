extends Node

#Variables
#Scenes
@export_file var PlayScene := "res://Scenes/Levels.tscn"
@export_file var OptionsScene := "res://Scenes/OptionsMenu.tscn"
@export_file var MainMenuScene := "res://Scenes/MainMenu.tscn"
@export_file var GameScene := "res://Scenes/Game.tscn"
@export_file var GameUIScene := "res://Scenes/GameUI.tscn"

#CurrentEntities
@export var CurrentLevel : LevelTileMap
@export var CurrentPlayer : Area2D

#Entities
@export_file var Entity := "res://Assets/Objects/Entity.tscn"
@export_file var LevelTiles := "res://Data/LevelTiles.tscn"

#Signals
#Wave
signal wave_inited()
signal wave_started()
signal wave_stepped()
signal wave_ended()

#Generator
signal generate_inited(level_data : LevelTileMap, lock_to_entity : Area2D)
signal generate_on_new_loaded(position : Vector2i, tile : LevelTileMap.Tile)
signal generate_on_loaded(position : Vector2i, tile : LevelTileMap.Tile)
signal generate_on_unloaded(position : Vector2i, tile : LevelTileMap.Tile)
signal generate_stopped(level_data : LevelTileMap, lock_to_entity : Area2D)

#Object
signal object_spawned(object : GameObjectResource)
signal object_despawned(object : GameObjectResource)

#Item
signal item_picked_up(item: ItemResource)

#Entity
signal entity_killed(entity : Entity)
signal entity_hit(entity : Entity)

#Player
