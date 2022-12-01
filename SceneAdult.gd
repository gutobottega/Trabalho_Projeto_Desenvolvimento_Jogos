extends Node2D

onready var timer = $Timer
onready var nav = $Navigation2D
onready var player = $Adult


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
