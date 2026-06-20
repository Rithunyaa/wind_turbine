extends Control

@onready var main_menu = $MainMenu
@onready var play_button = $MainMenu/play_button
@onready var settings_button = $MainMenu/settings_button
@onready var help_button = $MainMenu/help_button
@onready var settings_menu = $Settings
@onready var help_menu = $Help
@onready var large_popup = $large_popup
@onready var sfx_button = $Settings/sfx_button
@onready var music_button = $Settings/music_button
#@onready var sfx_label = $Settings/sfx_name
#@onready var music_label = $Settings/music_name
#@onready var music_player = $music_player
#@onready var sfx_player = $sfx_player
#@onready var fade_out = $fade_out
var play_original_scale

func _ready():
	_show_main_menu()
	#fade_out.mouse_filter = Control.MOUSE_FILTER_IGNORE
	#fade_out.visible = true
	#fade_out.modulate.a = 0

#CHANGE WHEN YOU ACTUALLY GET MUSIC!!!
	#sfx_button.text = "ON" if Global.sfx_enabled else "OFF"
	#music_button.text = "ON" if Global.music_enabled else "OFF"
	# Music state
	#if !Global.music_enabled:
		#music_player.stop()
	
	#play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	sfx_button.pressed.connect(_on_sfx_pressed)
	music_button.pressed.connect(_on_music_pressed)
	play_original_scale = play_button.scale
	play_button.mouse_entered.connect(_on_play_hover)
	play_button.mouse_exited.connect(_on_play_exit)
	play_button.button_down.connect(_on_play_hover)
	play_button.button_up.connect(_on_play_exit)

func _show_main_menu():
	main_menu.visible = true
	settings_menu.visible = false
	help_menu.visible = false
	large_popup.visible = false

func _show_settings():
	main_menu.visible = false
	settings_menu.visible = true
	help_menu.visible = false
	large_popup.visible = true

func _hide_all_popups():
	settings_menu.visible = false
	help_menu.visible = false
	large_popup.visible = false
	main_menu.visible = true

func _on_settings_pressed():
	#_play_sfx()
	_show_settings()

#func _on_play_pressed():
	#_play_sfx()
	#fade_out.visible = true
	#fade_out.modulate = Color(1, 1, 1, 0)
	#tween.tween_property(fade_out, "modulate:a", 1.0, 1.5)
	#get_tree().change_scene_to_file("res://instructions.tscn")

func _on_sfx_pressed():
	#Global.sfx_enabled = !Global.sfx_enabled

	#if Global.sfx_enabled:
		sfx_button.text = "ON"
		#sfx_player.play()
	#else:
		sfx_button.text = "OFF"

func _on_music_pressed():
	#Global.music_enabled = !Global.music_enabled

	#if Global.music_enabled:
		music_button.text = "ON"
		#music_player.play()
	#else:
		music_button.text = "OFF"
		#music_player.stop()

func _unhandled_input(event):
	if !settings_menu.visible:
		return
	if event is InputEventMouseButton and event.pressed:
		if sfx_button.get_global_rect().has_point(event.position):
			return
		if music_button.get_global_rect().has_point(event.position):
			return

		# Any other click closes settings
		_hide_all_popups()

#func _play_sfx():
	#if Global.sfx_enabled:
		#sfx_player.play()

func _on_play_hover():
	var tween = create_tween()
	tween.tween_property(play_button, "scale", play_original_scale * 1.03, 0.08)

func _on_play_exit():
	var tween = create_tween()
	tween.tween_property(play_button, "scale", play_original_scale, 0.08)
