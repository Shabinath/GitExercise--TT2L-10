extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # replace with function body.
	


func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://level_easy.tscn")
	pass
