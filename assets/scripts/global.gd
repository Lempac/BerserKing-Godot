extends Node

#Variables
#Scenes
@export_file var PlayScene := "res://scenes/levels.tscn"
@export_file var OptionsScene := "res://scenes/options_menu.tscn"
@export_file var MainMenuScene := "res://scenes/main_menu.tscn"
@export_file var GameScene := "res://scenes/game.tscn"
@export_file var GameUIScene := "res://scenes/game_ui.tscn"

#CurrentEntities
@export var CurrentLevel : LevelTileMap
@export var CurrentPlayer : CharacterBody2D

#Signals
#Wave
signal wave_inited(wave_data : WaveResource)
signal wave_started(wave_data : WaveResource)
signal wave_stepped(wave_data : WaveResource)
signal wave_ended(wave_data : WaveResource)

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

#Health
signal health_took_damage(health : Health)


#Item
signal item_picked_up(item: ItemResource)

#Player

#Controller
signal controller_touch(entity : Entity, other : Entity)

