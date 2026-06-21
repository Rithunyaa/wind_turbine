extends Node2D

@onready var blades = $MainBlades

@export var spin_speed = 2
@export var growth_speed = 1
@export var max_scale := 4.0

func _process(delta):
	blades.rotation += spin_speed * delta
	scale += Vector2.ONE * growth_speed * delta
	
	if scale.x >= max_scale or scale.y >= max_scale:
		queue_free()
