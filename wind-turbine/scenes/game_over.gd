extends Node2D

@onready var record_label = $record_label
@onready var home_button = $home_button
@onready var retry_button = $retry_button
@onready var time_alive_label = $final_time_label

const SAVE_PATH = "user://highscore.save"

var high_score: float = 0.0


func _ready():
	visible = false
	load_high_score()

	print("HIGH SCORE LOADED:", high_score)

	home_button.pressed.connect(_on_home_pressed)
	retry_button.pressed.connect(_on_retry_pressed)


func show_game_over():
	GameData.game_over = true
	visible = true

	var final_time = GameData.time_alive

	# safety
	if final_time < 0:
		final_time = 0.0

	var is_new_record = final_time > high_score

	if is_new_record:
		high_score = final_time
		save_high_score()

		record_label.text = "New Record!"
		time_alive_label.text = str(round(final_time * 10) / 10.0) + "s"

	else:
		record_label.text = "Your Time: " + str(round(final_time * 10) / 10.0) + "s"
		time_alive_label.text = "Record: " + str(round(high_score * 10) / 10.0) + "s"


func _on_home_pressed():
	GameData.game_over = false
	GameData.time_alive = 0.0
	get_tree().change_scene_to_file("res://scenes/homescreen.tscn")


func _on_retry_pressed():
	GameData.game_over = false
	GameData.time_alive = 0.0
	get_tree().reload_current_scene()


func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_32(high_score)


func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_32()
	else:
		high_score = 0.0
