extends CanvasLayer

@onready var player = get_node("/root/World/Player")

func _process(delta):
	if player:
		change_ammo()



func change_ammo():
	$Panel/Ammo_count.text = player.ammo 
