extends Node

#region Variables
#Scenes
@export_file var PlayScene := "res://scenes/levels_old.tscn"
@export_file var OptionsScene := "res://scenes/options_menu.tscn"
@export_file var MainMenuScene := "res://scenes/main_menu_old.tscn"
@export_file var GameScene := "res://scenes/game.tscn"
@export_file var GameUIScene := "res://scenes/game_ui.tscn"

#Current Entities
@export var CurrentGameUI : CanvasLayer
@export var CurrentLevel : TileMap
@export var CurrentPlayer : CharacterBody2D
@export var CurrentGameKillCount : int

@export var despawn_distance : int = 1200

#endregion

func change_scene(transitions_scene_path: String, scene: String, animation_name: String):
	var transitions_scene = load(transitions_scene_path).instantiate()
	add_child(transitions_scene)
	var anim_player : AnimationPlayer = transitions_scene.get_node('AnimationPlayer')
	anim_player.play(animation_name)
	await anim_player.animation_finished
	get_tree().change_scene_to_file(scene)
	anim_player.play_backwards(animation_name)
	await anim_player.animation_finished
	transitions_scene.queue_free()
