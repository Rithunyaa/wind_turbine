extends Node2D

@onready var blades = $MainBlades

var spin_speed = 1.5
var growth_speed = 0.2

func _process(delta):
	blades.rotation += spin_speed * delta
	scale += Vector2.ONE * growth_speed * delta
