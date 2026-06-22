extends CharacterBody2D

@export var gravity = 900
@export var jump_force = -350

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	# gravity
	velocity.y += gravity * delta

	# flap input
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_force
		anim.play("flap")

	# auto animation fallback
	if velocity.y > 0:
		anim.play("fall")
	else:
		if not Input.is_action_just_pressed("ui_accept"):
			anim.play("idle")

	move_and_slide()
