extends KinematicBody2D

export (int) var walkSpeed = 150
export (int) var runSpeed = 300
export var colliding = false
export var collidingGroup = ""

var speed
var velocity = Vector2.ZERO
var movement = 'Walk'
export var hit = 1000
export var killed = 0

onready var target := position
onready var sprite := $AnimatedSprite

func _ready():
	pass
func get_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	
	if Input.is_action_pressed("run"):
		movement = 'Walk'
		speed = runSpeed
	elif Input.is_action_pressed("ui_select"):
		movement = 'Attack'
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
	elif movement == 'Attack':
		sprite.play('Attack')
	else:
		sprite.play('Idle')
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	

func _process(delta):
	
	for member in get_tree().get_nodes_in_group("Adult_Enemy"):
		if movement == "Attack" and abs(position.x - member.position.x) < 80 and abs(position.y - member.position.y) < 80:
			member.hit = member.hit - delta * 1000
			
	if killed == 5:
		get_tree().change_scene("res://Transitions/VictoryScreen.tscn")
			
	hit += 0.2
			
			
	
	if hit < 0:
		get_tree().change_scene("res://Transitions/Adult Death.tscn")


func _on_Timer_timeout():
	get_tree().call_group("Adult_Enemy", "get_target_path", global_position)
