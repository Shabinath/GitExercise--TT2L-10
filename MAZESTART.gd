extends BoxContainer

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://main.tscn");



func _on_restart_pressed():
	get_tree().reload_current_scene()
