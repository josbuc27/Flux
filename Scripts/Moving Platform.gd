extends Node2D

@export var speed = 100

func _ready():
	pass



func _process(delta):
	$Path2D/PathFollow2D.progress += speed * delta
