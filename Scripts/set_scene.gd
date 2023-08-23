extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SceneTracker.set_current_scene(get_tree().current_scene.scene_file_path)



# Called every frame. 'delta' is the elapsed time since the previous frame.
