extends Node2D

@onready var blades = $MainBlades

var spin_speed = 1.5
var time_alive = 0.0

func _process(delta):
	time_alive += delta

	spin_speed = 1.5 + (time_alive * 0.05)

	blades.rotation += spin_speed * delta


func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")
