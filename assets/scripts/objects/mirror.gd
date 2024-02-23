extends Panel

@onready var player := $"../Player"
@onready var mirror_player := $SubViewportContainer/SubViewport/MirrorPlayer
var pos

func _ready() -> void:
	pos = global_position
	pos.y += size.y - 30
	pos.x += size.x/2

func _process(delta: float) -> void:
	$SubViewportContainer/SubViewport/Camera2D2.global_position = pos
	mirror_player.flip_h = !player.get_node('./AnimatedSprite2D').flip_h
	mirror_player.global_position = player.global_position
