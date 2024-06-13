extends CharacterBody2D

const speed = 100
var current_dir = "none"
var can_move = true

func _physics_process(delta):
	if can_move:
		player_movement(delta)

func player_movement(_delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_right")
		elif movement == 0:
			anim.play("idle_right")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk_right")
		elif movement == 0:
			anim.play("idle_right")
	
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_left")
		elif movement == 0:
			anim.play("idle_left")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_right")
		elif movement == 0:
			anim.play("idle_right")
	
	
func block_collision():
	can_move = false
	
func block_exit():
	can_move = true

func _on_CharacterBody2D_body_entered(body):
	if body.is_in_group("MazeBlock"):
		block_collision()

func _on_CharacterBody2D_body_exited(body):
	if body.is_in_group("MazeBlock"):
		block_exit()
