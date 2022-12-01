extends KinematicBody2D


onready var player = get_parent().get_node("Adult")
onready var sprite := $AnimatedSprite
var velocity = Vector2.ZERO
var move_speed = 350
var path = []
var nav 
var threshold = 5
export var hit = 1000
var near_player = false



# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play('Idle')
	yield(owner, "ready")
	nav = owner.nav
	remove_from_group("Adult_Enemy")
	

func _process(delta):
	if hit < 0:
		player.killed += 1
		queue_free()
	
	if abs(player.position.x - position.x) < 200 and abs(player.position.y - position.y) < 200:
		add_to_group("Adult_Enemy")
		if abs(player.position.x - position.x) < 50 and abs(player.position.y - position.y) < 50:
			near_player = true
		else:
			near_player = false
	else:
		remove_from_group("Adult_Enemy")
		

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
	if near_player:
		sprite.play("Attack")
		player.hit = player.hit - 10
	else:
		sprite.play('Walk')
	path = nav.get_simple_path(global_position, target_pos, false)
	
