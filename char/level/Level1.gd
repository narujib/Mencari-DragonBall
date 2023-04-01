extends Node2D

var point = 0
	
func _ready():
	var koins
	koins = $Koin2.get_children()
	$CanvasLayer._update_point(point)
	
	for koin in koins:
		koin.connect("koin_keambil", self, "_tambah_point")
		print(koin.name)
		
	var enemys
	enemys = $Enemys.get_children()
	
	for enemy in enemys :
		enemy.connect("player_hit", self, "_on_player_hit")
		
func _on_player_hit(damage):
	$Player._get_hit(damage)

func _tambah_point():
	point += 10
	$CanvasLayer._update_point(point)
	print(point)
