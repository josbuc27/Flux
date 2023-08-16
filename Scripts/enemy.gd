extends CharacterBody2D

@export var health_enemy : float = 100 
@export var damage : int = 30

func hit(damage: int):
	health_enemy -= damage


var direction = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



const SPEED = 60


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
	if health_enemy <= 0:
		$AnimationPlayer.play("death")
	
	else:
		$AnimationPlayer.play("run")
	


func update_facing_direction():
	if direction > 0:
		$Sprite2D.flip_h = false 
	elif direction < 0: 
		$Sprite2D.flip_h = true 



func take_damage(amount):
	print("take damage")
	health_enemy-= amount
	if health_enemy <= 0:
		$AnimationPlayer.play("death")
		
		queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and body.has_method("take_damage_knockback") and body.has_method("knockback"):
		body.take_damage_knockback(35)


