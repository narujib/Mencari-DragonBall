extends CanvasLayer

func _update_point(point_baru):
	$Control/Panel/Point.text = str(point_baru)
	
func _update_lives(lives):
	$Control2/TextureProgress.value = lives

func _ready():
	pass
