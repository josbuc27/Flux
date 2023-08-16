extends Control

@onready var player = get_node("/root/World/Player")


func _process(delta):
	if player:

		change_health()

func change_health() :
	if player.player_health <=35:
		$TextureProgressBar.value= 35
	elif player.player_health >35 and player.player_health <=66:
		$TextureProgressBar.value =66
	elif player.player_health >66:
		$TextureProgressBar.value = 100
