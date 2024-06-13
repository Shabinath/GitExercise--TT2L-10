extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(1)
		velocity.y = 0
		velocity.x = 0
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir 
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving right")
		elif movement == 0:
			anim.play("right idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("moving left")
		elif movement == 0:
			anim.play("left idle")
			
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving left")
		elif movement == 0:
			anim.play("left idle")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving right")
		elif movement == 0: 
			anim.play("right idle")
