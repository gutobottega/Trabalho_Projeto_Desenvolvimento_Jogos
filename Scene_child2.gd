extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Floor.centered_textures = true
	$Floor2.centered_textures = true
	$Floor3.centered_textures = true
	$Label.text = "Suba"

func _physics_process(delta):
	pass
	
func _process(delta):
	if $Player.colliding and Input.is_action_pressed("ui_select"):
		
		if $Player.collidingGroup == "Obstacle1":
			$Floor.set_collision_layer_bit(0,0)
			$Floor.set_collision_mask_bit(0,0)
			$Floor.hide()
			fireTween()
			
		elif $Player.collidingGroup == "Obstacle2":
			$Label.text = "Volte"
			$Floor2.set_collision_layer_bit(0,0)
			$Floor2.set_collision_mask_bit(0,0)
			$Floor2.hide()
			fireTween()
			
		elif $Player.collidingGroup == "Obstacle3":
			$Floor2.set_collision_layer_bit(0,0)
			$Floor2.set_collision_mask_bit(0,0)
			$Floor2.hide()
			fireTween()
			
	

func fireTween():
	var endPos = $Player.get_global_position() + Vector2(10,10)
	$Tween.interpolate_property($Label, "rect_position",
		$Player.get_global_position(), endPos, 5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

