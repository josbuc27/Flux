extends Area2D

var velocity = Vector2()
var speed = 2

@export var damage : int 

func _physics_process(delta):
	translate(velocity * delta * speed)
	

func _on_bullet_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + "took" + str(damage))
			
