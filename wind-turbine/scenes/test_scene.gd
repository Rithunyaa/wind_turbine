extends Node2D

@onready var timer_label = $CanvasLayer/TimerLabel

func _process(delta):
	if GameData.game_over:
		return
	GameData.time_alive += delta
	timer_label.text = "Time: " + str(snapped(GameData.time_alive, 0.1))
