extends Node

#Variables
#Scenes
@export_file var PlayScene := "res://Scenes/levels.tscn"
@export_file var OptionsScene := "res://Scenes/options_menu.tscn"
@export_file var MainMenuScene := "res://Scenes/main_menu.tscn"
@export_file var GameScene := "res://Scenes/game.tscn"
@export_file var GameUIScene := "res://Scenes/game_ui.tscn"

#CurrentEntities
@export var CurrentLevel : LevelTileMap
@export var CurrentPlayer : CharacterBody2D

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

#Wave generator
signal wave_generate_inited(wave_data : WaveResource, lock_to_generator : Generator)
signal wave_generate_on_new_spawned(position : Vector2i, entity : Entity)
signal wave_generate_on_spawned(position : Vector2i, entity : Entity)
signal wave_generate_on_despawned(position : Vector2i, entity : Entity)
signal wave_generate_stopped(wave_data : WaveResource, lock_to_generator : Generator)

#Object
signal object_spawned(object : GameObjectResource)
signal object_despawned(object : GameObjectResource)

#Item
signal item_picked_up(item: ItemResource)

#Entity
signal entity_killed(entity : Entity)
signal entity_hit(entity : Entity)

#Player
