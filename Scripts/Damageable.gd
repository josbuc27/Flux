extends Node

class_name Damageable 

@export var health : float = 100

func hit(damage : int):
	health -= damage
	
	
	if(health <= 0):
		get_parent().queue_free()
