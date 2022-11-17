extends KinematicBody2D


onready var sprite := $AnimatedSprite
var move_speed  =100
export (NodePath) var patrol_path
var patrol_points
var patrol_index = 0
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_node(".").name)
	sprite.play('Idle')
	if patrol_path:
		sprite.play('Walk')
		patrol_points = get_node(patrol_path).curve.get_baked_points()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !patrol_path:
		return
	if patrol_index < patrol_points.size() - 1:
		var target = patrol_points[patrol_index]
		if position.distance_to(target) < 1:
			patrol_index = patrol_index + 1
			target = patrol_points[patrol_index]
		velocity = (target - position).normalized() * move_speed
		move()

func move():
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.play('Idle')
	velocity = move_and_slide(velocity)
