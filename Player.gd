extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2.ZERO

onready var target := position
onready var sprite := $AnimatedSprite

func get_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	
	if velocity.x > 0:
		sprite.flip_h = false
		sprite.play('Walk')
	elif velocity.x < 0:
		sprite.flip_h = true
		sprite.play('Walk')
	elif velocity.y > 0:
		sprite.play('Walk')
	elif velocity.y < 0:
		sprite.play('Walk')
	else:
		sprite.play('Idle')
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
