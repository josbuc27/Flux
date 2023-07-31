extends CharacterBody2D

@export var health : int = 100 

var direction = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

const fireballPath = preload("res://Scenes/fireball.tscn")

func _ready():
	pass
	
func _process(delta):
	pass
	
func _physics_process(delta):
	pass


func shoot():
	$AnimationPlayer.play("shoot")
	
	await $AnimationPlayer.animation_finished
	
	var fireball = fireballPath.instantiate()
	
	get_parent().add_child(fireball)
	fireball.position = $Marker2D.global_position
	$AnimationPlayer.play("walk")
	

func take_damage(amount):
	print("take damage")
	health-= amount
	if health <= 0:
		queue_free()
	print("I'm dead")
	pass



func _on_timer_timeout():
	shoot()
