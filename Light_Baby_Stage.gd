extends KinematicBody2D



export var colliding = false
export var collidingGroup = ""



func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	colliding = true
	collidingGroup = 'area2d'
	print('oieeee')
