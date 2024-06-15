extends Control


func _on_play_again_pressed():
<<<<<<< HEAD
	get_tree().change_scene_to_file("res://level_two.tscn")



func _on_quit_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
=======
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
>>>>>>> da19ea1417fd3ee0c666de307ed784b2999b5fbd
