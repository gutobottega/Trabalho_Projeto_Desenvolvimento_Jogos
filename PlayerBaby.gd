extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2.ZERO

onready var target := position
onready var sprite := $AnimatedSprite

func get_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	
	if velocity.x > 0:
		sprite.play('Right')
	elif velocity.x < 0:
		sprite.play('Left')
	elif velocity.y > 0:
		sprite.play('Down')
	elif velocity.y < 0:
		sprite.play('Up')
	else:
		sprite.stop()
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)




func _on_Area2D_body_entered(body):
	print('Ir para proxima cena')
