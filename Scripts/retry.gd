extends Control


func _ready():
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file(SceneTracker.get_previous_scene())
