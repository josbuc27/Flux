extends Area2D

var velocity = Vector2()
var speed = 2

func _physics_process(delta):
	translate(velocity * delta * speed)
	

func _on_bullet_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
