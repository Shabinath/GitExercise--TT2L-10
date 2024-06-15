extends Control

func _ready():
	# Connect the signals to the respective methods
	$ColorRect/CenterContainer/VBoxContainer/restart.connect("pressed", Callable(self, "_on_restart_pressed"))
	$ColorRect/CenterContainer/VBoxContainer/QuitButton2.connect("pressed", Callable(self, "_on_quit_button_2_pressed"))

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true


func _on_quit_button_2_pressed():
	get_tree().quit()

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()

