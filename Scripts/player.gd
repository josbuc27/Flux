extends CharacterBody2D


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY : float  = -400.0
@onready var animator = $AnimationPlayer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_locked : bool = false 
var direction :  Vector2 = Vector2.ZERO

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		


	update_animation()
	update_facing_direction()
	print(velocity.x)
	move_and_slide()


func update_animation():
	if velocity.x != 0:
		animator.play("run")
	elif Input.is_action_just_pressed("jump"):
		animator.play("jump")
	else:
		animator.play("idle")


func update_facing_direction():	
	if direction.x > 0:
		$Sprite2D.flip_h = false 
	elif direction.x < 0: 
		$Sprite2D.flip_h = true 
