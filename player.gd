extends CharacterBody2D
@onready var anim = $AnimationPlayer
@export var speed = 400

func _ready():
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if (abs(velocity) < 0.1):
		anim.play("idle")

func _physics_process(_delta):
	get_input()
	move_and_slide()
