extends CanvasLayer

export (int) var minutes = 0
export (int) var seconds = 0
var ms = 0

func _update_point(point_baru):
	$Control/Panel/Point.text = str(point_baru)
	
func _update_lives(lives):
	$Control2/TextureProgress.value = lives
	

func _physics_process(delta):
	if seconds > 0 and ms <= 0 :
		seconds -= 1
		ms = 10
	if minutes > 0 and seconds <= 0 :
		minutes -= 1
		seconds = 60
		
	if (minutes <= 0 and seconds <= 0 and ms <= 0):
		get_tree().change_scene("res://char/level/EndGame.tscn")
		
	if seconds >= 10:
		$Control3/sec.set_text(str(seconds))
	else :
		$Control3/sec.set_text("0"+str(seconds))
	if ms >= 10:
		$Control3/ms.set_text(str(ms))
	else :
		$Control3/ms.set_text("0"+str(ms))
	if minutes >= 10:
		$Control3/min.set_text(str(minutes))
	else :
		$Control3/min.set_text("0"+str(minutes))


func _on_Timer_timeout():
	ms -= 1
	pass # Replace with function body.
