extends CharacterBody2D

@export var speed = 25
var player_chase = false
var player = null

func _physics_process(_delta):
	if player_chase:
		position += (player.position - position) / speed
		if is_colliding_with_player():
			restart_game()
		
func _on_detection_area_body_entered(_body):
	player = _body
	player_chase = true

func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false

func is_colliding_with_player():
	return player != null and global_position.distance_to(player.global_position) < 10  

func restart_game():
	get_tree().reload_current_scene()
