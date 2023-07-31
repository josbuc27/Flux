extends Area2D

var velocity = Vector2()
var speed = 2

@export var damage : int 

func _physics_process(delta):
	translate(velocity * delta * speed)
	




func _on_body_entered(body):
	if body.is_in_group("player"):
		return
	if body.has_method("take_damage"):
		body.take_damage(50)
	queue_free()
	
