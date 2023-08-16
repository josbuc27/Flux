extends Area2D

var speed = 300 




func _physics_process(delta):
	translate(Vector2.LEFT * speed * delta)




func _on_body_entered(body):
	if body.has_method("take_damage") and body.is_in_group("player"):
		body.take_damage(35)
		queue_free()
