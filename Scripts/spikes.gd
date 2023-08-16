extends Area2D

@export var damage : int 


func _ready():
	$AnimationPlayer.play("SpikeTrigger")




func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("take_damage"):
		body.take_damage(35)
	
