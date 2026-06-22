extends Node2D

@onready var camera = $Player/Camera2D
@onready var turbine = $Turbine

var game_running = true

func _ready():
	start_sequence()

func start_sequence():
	await get_tree().create_timer(3.0).timeout
	
	# zoom in (better later: tween)
	camera.zoom = Vector2(3, 3)
	
	# WAIT for player judgment window
	await get_tree().create_timer(2.0).timeout
	
	check_result()

	camera.zoom = Vector2(2, 2)

func check_result():
	var blades = turbine.get_node("BladesCollisionShape") # example
	
	if blades_over_center():
		print("FAIL")
	else:
		print("PASS")
		
	
func blades_over_center() -> bool:
	return false # placeholder for now
