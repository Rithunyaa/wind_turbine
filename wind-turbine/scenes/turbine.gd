extends Node2D

@onready var blades = $MainBlades
@onready var game_over_popup = $"../GameOverPopup"
var spin_speed = 1.5
var game_ended = false


func _process(delta):
	if GameData.game_over:
		return

	blades.rotation += spin_speed * delta


func _on_body_entered(body):
	if game_ended:
		return

	if body.is_in_group("player"):
		game_ended = true

		# STOP GAME
		GameData.game_over = true

		# STOP EVERYTHING + SHOW POPUP
		game_over_popup.show_game_over()
