extends KinematicBody2D

var speed = 100
var arah = -1
var damage = 10

signal player_hit


func _physics_process(delta):
	if (is_on_wall() or (not $RayCast2D.is_colliding())):
		arah = arah * -1
		$RayCast2D.position.x *= -1
	
	var gerakan = Vector2(arah * speed,0)
	if (gerakan.x > 0):
		$AnimatedSprite.flip_h = true
	else :
		$AnimatedSprite.flip_h = false
	
	if(!is_on_floor()):
		gerakan.y = 200
	
	move_and_slide(gerakan, Vector2.UP)
			


func _on_HitArea_body_entered(body):
	emit_signal("player_hit", damage, position)


func _on_Area2D_body_entered(body):
	print("pemain")
