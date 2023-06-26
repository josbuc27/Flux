extends CharacterBody2D


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY : float  = -400.0
@onready var animator = $AnimationPlayer

const bulletPath = preload("res://Scenes/bullet.tscn")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_locked : bool = false 
var direction = 0
var ammo = 3 

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		


	update_animation()
	update_facing_direction()
	move_and_slide()



func _process(delta):
	if Input.is_action_just_pressed("shoot") and ammo >0:
		shoot()
	
	

func reduce_ammo():
	if shoot():
		ammo - 1 
		print(ammo)
		


func shoot():
	var bullet = bulletPath.instantiate()
	
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
	
	bullet.velocity = get_global_mouse_position() - bullet.position

func update_animation():
	if velocity.x != 0:
		animator.play("run")
	elif velocity.y != 0:
		animator.play("jump")
	elif Input.is_action_just_pressed("shoot"):
		animator.play("shoot")  
	else:
		animator.play("idle")



func update_facing_direction():
	if direction > 0:
		$Sprite2D.flip_h = false 
	elif direction < 0: 
		$Sprite2D.flip_h = true 

