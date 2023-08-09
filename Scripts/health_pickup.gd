extends Area2D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("health_increase"):
		body.health_increase(50)
		queue_free()

