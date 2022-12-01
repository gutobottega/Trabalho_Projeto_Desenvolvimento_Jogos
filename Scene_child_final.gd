extends Node2D

onready var timer = $Timer
onready var nav = $Navigation2D
onready var player = $Player
onready var enemy = $Enemy


func _on_Area2D_body_entered(body):
	print('scene')
	timer.start(0.1)
	
func _process(delta):
	#print("p:"+str(player.position))
	#print("e:"+str(enemy.position))
	var sub: Vector2 = player.position - enemy.position
	print(sub)
	if abs(sub.x) < 2.5 and abs(sub.y) < 2.5:
		get_tree().change_scene("res://Transitions/ChildDeath.tscn")
	
	if player.colliding:
		
		if player.collidingGroup == "ExitAreaChild":
			get_tree().change_scene("res://Transitions/BeforeAdult.tscn")
		
		
