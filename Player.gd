extends KinematicBody2D

export (int) var walkSpeed = 150
export (int) var runSpeed = 300

var speed
var velocity = Vector2.ZERO
var movement = 'Walk'

onready var target := position
onready var sprite := $AnimatedSprite

func get_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	
	if Input.is_action_pressed("run"):
		movement = 'Run'
		speed = runSpeed
	else: 
		movement = 'Walk'
		speed = walkSpeed
	
	if velocity.x > 0:
		sprite.flip_h = false
		sprite.play(movement)
	elif velocity.x < 0:
		sprite.flip_h = true
		sprite.play(movement)
	elif velocity.y > 0:
		sprite.play(movement)
	elif velocity.y < 0:
		sprite.play(movement)
	else:
		sprite.play('Idle')
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)