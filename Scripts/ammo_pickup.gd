extends Area2D






func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("ammo_increase"):
		body.ammo_increase(2)
		queue_free()
