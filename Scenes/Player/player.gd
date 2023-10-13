extends CharacterBody2D

@export var speed = 80
const SPRITE_SIZE = 7
const LEFT_BORDER = 0 + SPRITE_SIZE
const RIGHT_BORDER = 384 - SPRITE_SIZE  # Adjust this value according to your needs

func _process(delta):
	move_player()

func move_player():
	var movementVector = Vector2()

	if Input.is_action_pressed("move_left") && check_Borders(movementVector.x, "left"):
		movementVector.x -= 1
	elif Input.is_action_pressed("move_right") && check_Borders(movementVector.x, "right"):
		movementVector.x += 1

	velocity = movementVector.normalized() * speed
	move_and_slide()

func check_Borders(number: float, direction: String) -> bool:
	var character_position = get_global_transform().origin.x

	if direction == "left":
		return character_position + number >= LEFT_BORDER
	elif direction == "right":
		return character_position + number <= RIGHT_BORDER
	else:
		return true
