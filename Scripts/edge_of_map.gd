extends Area2D

@export var starting_position = get_global_transform()
@export var damage : int 

func _on_body_entered(body):
	if body.has_method("respawn") and body.has_method("take_damage"):
		body.take_damage(50)
		body.respawn()
		
