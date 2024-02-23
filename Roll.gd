extends Node2D

@onready var timer = $RollTimer

func StartRoll(dur):
	timer.start(dur)

func IsRolling():
	return !timer.is_stopped()
