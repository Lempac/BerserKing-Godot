extends Node

#region Variables
#Scenes
@export_file var PlayScene := "res://scenes/levels.tscn"
@export_file var OptionsScene := "res://scenes/options_menu.tscn"
@export_file var MainMenuScene := "res://scenes/main_menu.tscn"
@export_file var GameScene := "res://scenes/game.tscn"
@export_file var GameUIScene := "res://scenes/game_ui.tscn"

#Current Entities
@export var CurrentLevel : LevelTileMap
@export var CurrentPlayer : Player

#endregion

#region Signals
#Wave
signal wave_started(wave_data : WaveResource)
signal wave_stepped(wave_data : WaveResource)
signal wave_ended(wave_data : WaveResource)

#Level generator
signal level_generate_inited(level_data : LevelTileMap, lock_to_entity : CharacterBody2D)
signal level_generate_on_new_loaded(position : Vector2i, tile : LevelTileMap.Tile)
signal level_generate_on_loaded(position : Vector2i, tile : LevelTileMap.Tile)
signal level_generate_on_unloaded(position : Vector2i, tile : LevelTileMap.Tile)
signal level_generate_stopped(level_data : LevelTileMap, lock_to_entity : CharacterBody2D)

#Wave generator
signal wave_generate_inited(wave_data : WaveResource, lock_to_entity : CharacterBody2D)
signal wave_generate_on_new_spawned(position : Vector2i, entity : Entity)
signal wave_generate_on_spawned(position : Vector2i, entity : Entity)
signal wave_generate_on_despawned(position : Vector2i, entity : Entity)
signal wave_generate_stopped(wave_data : WaveResource, lock_to_entity : CharacterBody2D)

#Item generator
signal item_generate_stopped()
signal item_generate_on_spawned()
signal item_generate_on_new_spawned()
signal item_generate_inited()

#Object
signal object_spawned(object : GameObject)
signal object_despawned(object : GameObject)

#Health
signal health_took_damage(health : Health)
signal health_killed(entity : Entity)

#Item
signal item_picked_up(item: ItemResource)

#Player


#Controller
signal controller_touch(game_objct : GameObject, other : GameObject)


#endregion

