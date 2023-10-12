extends CharacterBody2D

@export var speed = 80

func _process(delta):
	move_player()

func move_player():
	var movementVector = Vector2()
	
	# Check for left and right input
	if Input.is_action_pressed("move_left"):
		movementVector.x -= 1
	if Input.is_action_pressed("move_right"):
		movementVector.x += 1

	velocity = movementVector.normalized() * speed
	move_and_slide()
