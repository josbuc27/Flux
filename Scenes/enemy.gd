extends CharacterBody2D

@export var health : int = 100 

@export var starting_move_direction = -1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var direction = starting_move_direction

const SPEED = 30


	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y  = move_toward(velocity.y,gravity,5)
	else:
		velocity.y = 0

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0 ,SPEED)
	move_and_slide()
	animation_change()
	update_facing_direction()

func animation_change():
	if health == 0:
		$AnimationPlayer.play("death")
	
	else:
		$AnimationPlayer.play("idle")
	


func update_facing_direction():
	if direction > 0:
		$Sprite2D.flip_h = false 
	elif direction < 0: 
		$Sprite2D.flip_h = true 
