extends Area2D

var koin_point = 10

signal koin_keambil



func _ambil_koin(body):
	$AnimationPlayer.play("hilang")

func _die():
	emit_signal("koin_keambil", koin_point)
	queue_free()
