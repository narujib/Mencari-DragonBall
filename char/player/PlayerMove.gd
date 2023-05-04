extends KinematicBody2D

export var speed = 300
export var jump_speed = 1200
var movement = Vector2(0,0)
const gravity = 50
export var lives = 30
export var max_lives = 30



func _get_lives():
	return lives

func _set_lives(l):
	lives = l

func _get_hit_enemy(health):
	#max_lives = max_lives
	var prev_lives = lives
	if(prev_lives == max_lives):
		_set_lives(_get_lives() + 0)
	else:
		_set_lives(_get_lives() + health)
	print(lives)
	
	
func _get_hit(damage, enemy_position):
	_set_lives(_get_lives() - damage)
	print(lives)
	
	var arah = (enemy_position - position).normalized()
	var pantul = Vector2(-arah * 5000)
	move_and_slide(pantul, Vector2.UP, false, 4, PI/4, false)
	set_modulate(Color(0,1,1,1))
	$Timer.start()
	

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

	


func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))
