extends KinematicBody2D

export (int) var walkSpeed = 150
export (int) var runSpeed = 300
export var colliding = false
export var collidingGroup = ""

var speed
var velocity = Vector2.ZERO
var movement = 'Walk'

onready var target := position
onready var sprite := $AnimatedSprite

func _ready():
	$key.hide()
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
	


	
func _on_AltarArea1_body_entered(body):
	colliding = true
	collidingGroup = "Obstacle1"
	
	
func _on_AltarArea1_body_exited(body):
	colliding = false
	collidingGroup = ""


func _on_AltarArea2_body_entered(body):
	colliding = true
	collidingGroup = "Obstacle2"


func _on_AltarArea2_body_exited(body):
	colliding = false
	collidingGroup = ""


func _on_AltarArea3_body_entered(body):
	colliding = true
	collidingGroup = "Obstacle3"


func _on_AltarArea3_body_exited(body):
	colliding = false
	collidingGroup = ""
	
	
###############
# Signal List #
###############

func _on_AltarBox1_body_entered(body):
	print("y")
	colliding = true
	collidingGroup = "AltarBox1"


func _on_AltarBox1_body_exited(body):
	print("n")
	colliding = false
	collidingGroup = ""


func _on_TransitionAreaChildInicialFinal_body_entered(body):
	print("yy")
	colliding = true
	collidingGroup = "TransitionAreaChildInicialFinal"

func _on_Timer_timeout():
	get_tree().call_group("Enemies", "get_target_path", global_position)



func _on_TransitionArea_body_entered(body):
	colliding = true
	collidingGroup = "ExitAreaChild"


func _on_Area2D_body_entered(body):
	pass # Replace with function body.


func _on_EnemyCollider_body_entered(body):
	pass


func _on_KeyArea_area_entered(area):
	print('hello')


func _on_KeyArea_body_entered(body):
	$key.show()
	colliding = true
	collidingGroup = "KeyArea"
