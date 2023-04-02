extends Node2D

var point = 0
	
func _ready():
	var koins
	koins = $Koin2.get_children()
	$GUI._update_point(point)
	
	for koin in koins:
		koin.connect("koin_keambil", self, "_tambah_point")
		print(koin.name)
		
	var enemys
	enemys = $Enemys.get_children()
	
	for enemy in enemys :
		enemy.connect("player_hit", self, "_on_player_hit")
		
func _on_player_hit(damage, enemy_pos):
	$Player._get_hit(damage, enemy_pos)
	$GUI._update_lives($Player._get_lives())
	
	if ($Player._get_lives() <= 0):
		get_tree().reload_current_scene()

func _tambah_point():
	point += 10
	$GUI._update_point(point)
	print(point)
