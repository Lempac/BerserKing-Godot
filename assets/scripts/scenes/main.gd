extends Control

@onready var anim := $AnimationPlayer

func _ready() -> void:
	anim.play('intro')
	
func _input(event: InputEvent) -> void:
	if anim.is_playing() and event.is_action_pressed("ui_accept"):
		anim.speed_scale = 3
	elif event.is_action_pressed("ui_accept"):
		anim.play("open_door")
		await anim.animation_finished
		await get_tree().create_timer(.3).timeout
		Global.change_scene("res://assets/scripts/globals/default_transition.tscn", "res://scenes/lobby.tscn", "fade_center")
		process_mode = Node.PROCESS_MODE_DISABLED
		
