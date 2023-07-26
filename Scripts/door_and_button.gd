extends Node2D

func _ready():
	$AnimationPlayer.play("ButtonUp")
	$AnimationPlayer.play("DoorClosed")



func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("ButtonDown") 
		$AnimationPlayer.play("DoorOpen")





func _on_timer_timeout():
	queue_free()


func _on_area_2d_body_exited(body):
	$Timer.start()
