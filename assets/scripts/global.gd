extends Node

#region Variables
#Scenes
@export_file var PlayScene := "res://scenes/levels.tscn"
@export_file var OptionsScene := "res://scenes/options_menu.tscn"
@export_file var MainMenuScene := "res://scenes/main_menu.tscn"
@export_file var GameScene := "res://scenes/game.tscn"
@export_file var GameUIScene := "res://scenes/game_ui.tscn"

#Current Entities
@export var CurrentGameUI : CanvasLayer
@export var CurrentLevel : TileMap
@export var CurrentPlayer : CharacterBody2D

#endregion

