extends Area2D

signal koin_keambil



func _ambil_koin(body):
	$AnimationPlayer.play("hilang")

func _die():
	emit_signal("koin_keambil")
	queue_free()
