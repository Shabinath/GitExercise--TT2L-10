extends Area2D

var entered = false

func _on_area_entered(_area):
	entered = true

func _on_area_exited(_area):
	entered = false

func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://control.tscn")
