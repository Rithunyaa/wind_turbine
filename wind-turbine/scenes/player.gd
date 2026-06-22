extends CharacterBody2D

@export var speed := 600.0
@export var smooth := 15.0

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_dir = input_dir.normalized()
	velocity = input_dir * speed
	move_and_slide()
