extends Node2D

onready var player = $Player
onready var nextScene = preload("res://Scene_child_final.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	if player.colliding:
		
		if Input.is_action_just_pressed("ui_select"):
			if player.collidingGroup == "AltarBox1":
				$ObstacleChildInicial1.set_collision_layer_bit(0,0)
				$ObstacleChildInicial1.set_collision_mask_bit(0,0)
				$ObstacleChildInicial1.hide()
			
		if player.collidingGroup == "TransitionAreaChildInicialFinal":
			print("yggg")
			print(get_tree().change_scene("res://Scene_child_final.tscn"))
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
