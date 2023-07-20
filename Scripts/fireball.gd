extends Area2D

var speed = 300 




func _physics_process(delta):
	translate(Vector2.LEFT * speed * delta)
