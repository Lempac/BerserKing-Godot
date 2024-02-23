extends SubViewportContainer

@onready var player := $"../Player"
@onready var mirror_player := $SubViewport/MirrorPlayer

func _process(delta: float) -> void:
	mirror_player.flip_h = !player.get_node('./AnimatedSprite2D').flip_h
	mirror_player.global_position = player.global_position
