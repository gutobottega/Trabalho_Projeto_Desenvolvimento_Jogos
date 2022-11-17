extends KinematicBody2D


onready var sprite := $AnimatedSprite
var velocity = Vector2.ZERO
var move_speed = 100
var path = []
var nav
var threshold = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play('Idle')
	yield(owner, "ready")
	nav = owner.nav
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
func move_to_target():
	if global_position.distance_to(path[0]) < threshold:
		path.remove(0)
	else:
		var direction = global_position.direction_to(path[0])
		velocity = direction * move_speed
		move()
		
func move():

	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.play('Idle')
	velocity = move_and_slide(velocity)
	
func get_target_path(target_pos):
	sprite.play('Walk')
	path = nav.get_simple_path(global_position, target_pos, false)
