extends Node

var current_scene
var previous_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func set_current_scene(scene):
	previous_scene = scene

func get_previous_scene():
	return previous_scene
