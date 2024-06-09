extends CharacterBody2D

# Speed of the enemy
var speed = 100
var player_chase = false
var player = null

# Reference to the AnimatedSprite2D node
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if player_chase and player:
		# Calculate the direction vector towards the player
		var direction = (player.position - position).normalized()

		# Update velocity
		velocity = direction * speed
		move_and_slide()

		# Determine the primary direction and set the appropriate animation
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.flip_h = false
				animated_sprite.play("moving_right")
			else:
				animated_sprite.flip_h = true
				animated_sprite.play("moving_right")
		else:
			if direction.y > 0:
				animated_sprite.play("moving_down")
			else:
				animated_sprite.play("moving_up")
	else:
		# Stop the animation and set idle state
		animated_sprite.play("idle")
		velocity = Vector2.ZERO
		move_and_slide()

# Function triggered when the player enters the detection area
func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):  # Ensure it's the player
		player = body
		player_chase = true

# Function triggered when the player exits the detection area
func _on_detection_area_body_exited(body):
	if body == player:
		player = null
		player_chase = false

# Optional: Called when the node enters the scene tree for the first time
func _ready():
	# Set the default animation to idle
	animated_sprite.play("idle")
