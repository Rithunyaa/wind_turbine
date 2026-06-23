extends CharacterBody2D

@export var speed = 500
@onready var sprite = $AnimatedSprite2D
@onready var margin = Vector2(32, 32)
@onready var screen_size = get_viewport_rect().size


func _ready():
	sprite.play("idle")
	add_to_group("player")

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1

	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	if Input.is_action_pressed("move_down"):
		direction.y += 1

	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	velocity = direction.normalized() * speed
	move_and_slide()

	# Choose animation based on movement direction
	if direction != Vector2.ZERO:

		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				sprite.play("fly_right")
			else:
				sprite.play("fly_left")
		else:
			if direction.y > 0:
				sprite.play("fly_down")
			else:
				sprite.play("fly_up")
				
	clamp_to_screen()
	
func clamp_to_screen():
	var pos = global_position

	pos.x = clamp(pos.x, margin.x, screen_size.x - margin.x)
	pos.y = clamp(pos.y, margin.y, screen_size.y - margin.y)

	global_position = pos
