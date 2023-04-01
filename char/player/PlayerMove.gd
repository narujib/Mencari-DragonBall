extends KinematicBody2D

export var speed = 300
export var jump_speed = 1200
var movement = Vector2(0,0)
const gravity = 50
export var lives = 5



func _get_lives():
	return lives

func _set_lives(l):
	lives = l
	
func _get_hit(damage):
	_set_lives(_get_lives() - damage)
	print(lives)


func _physics_process(delta):
	
	if (not is_on_floor()):
		movement.y += gravity
	else:
		movement.y = 0
	
	if (Input.is_action_pressed("maju")):
		movement.x = speed
	elif (Input.is_action_pressed("mundur")):
		movement.x = -speed
	else:
		movement.x =0
		
	if (movement.x > 0):
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif (movement.x < 0):
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	elif (movement.y < 0):
		$AnimatedSprite.play("jump")
	else:
		$AnimatedSprite.play("iddle")		
	
	if (Input.is_action_pressed("lompat") and is_on_floor()):
		$AnimatedSprite.play("jump")
		movement.y = -jump_speed
		
	move_and_slide(movement, Vector2(0,-1))

	
