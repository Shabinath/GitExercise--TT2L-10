extends Control


func resume():
	get_tree().paused = false

func _on_quit_button_2_pressed():
	get_tree().quit()

func _on_restart_pressed():
	get_tree().reload_current_scene()


