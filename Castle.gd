extends Area2D

signal win

func _init():
	visible = false

func win():
	pass



func _on_Castle_body_entered(body):
	pass # Replace with function body.


func _on_Castle_win():
	visible = true
	pass # Replace with function body.
