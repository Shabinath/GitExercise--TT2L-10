extends Control

var settings_file = ConfigFile.new()

var audio: Vector3 = Vector3(70.0, 70.0, 70.0)



@onready var option_container = get_node("%OptionContainer")
@onready var main_container = get_node("%MainContainer")



func _first_time() -> void:
	# -- audio
	settings_file.set_value("audio", "General", audio.x)
	settings_file.set_value("audio", "Music", audio.y)
	settings_file.set_value("audio", "SFX", audio.z)

	settings_file.save("res://settings.cfg")


func _load_settings():
	if settings_file.load("res://settings.cfg") != OK:
		_first_time()
	else:
		pass


func _save_settings() -> void:
	# -- audio
	settings_file.set_value("audio", "General", audio.x)
	settings_file.set_value("audio", "Music", audio.y)
	settings_file.set_value("audio", "SFX", audio.z)

	settings_file.save("res://settings.cfg")


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://level_two.tscn")
	pass  


func _on_option_button_pressed():
	option_container.visible = true
	main_container.visible = false


func _on_exit_button_pressed():
	get_tree().quit()






func _on_general_h_scroll_bar_value_changed(value):
	audio.x = value


func _on_music_h_scroll_bar_value_changed(value):
	audio.y = value


func _on_sfx_h_scroll_bar_value_changed(value):
	audio.z = value




func _on_return_button_pressed():
	main_container.visible = true
	option_container.visible = false


func _on_apply_button_pressed():
	main_container.visible = true
	option_container.visible = false
	_save_settings()


