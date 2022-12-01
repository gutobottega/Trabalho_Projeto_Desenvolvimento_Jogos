extends Node2D

onready var timer = $Timer
onready var nav = $Navigation2D
onready var player = $Player
onready var enemy = $Enemy
onready var audio = $AudioStreamPlayer

func _ready():
	audio.play()

func _on_Area2D_body_entered(body):
	print('scene')
	timer.start(0.1)
	
func _process(delta):
	#print("p:"+str(player.position))
	#print("e:"+str(enemy.position))
	var sub: Vector2 = player.position - enemy.position
	if abs(sub.x) < 2.5 and abs(sub.y) < 2.5:
		get_tree().change_scene("res://Transitions/ChildDeath.tscn")
	
	if player.colliding:
		
		if player.collidingGroup == "ExitAreaChild":
			get_tree().change_scene("res://Transitions/BeforeAdult.tscn")
		
		if player.collidingGroup == "KeyArea":
			$Obstacle.set_collision_layer_bit(0,0)
			$Obstacle.set_collision_mask_bit(0,0)
			$Obstacle.hide()
