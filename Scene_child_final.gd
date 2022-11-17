extends Node2D

onready var timer = $Timer
onready var nav = $Navigation2D


func _on_Area2D_body_entered(body):
	print('scene')
	timer.start(0.1)
