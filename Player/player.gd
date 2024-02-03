extends CharacterBody2D
@onready var anim = $AnimationPlayer
@export var speed = 75
@export var study_dialogue:JSON
@export var marks_dialogue:JSON
@export var mom_dialogue:JSON
@export var tennis_dialogue:JSON
@onready var state={
	"player_name":"Saptarshi"
}
func _ready():
	($dialogue_out/DialogueBox/VBoxContainer/Label as Label).visible=false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	#print(velocity)
	if ((velocity[0] ==0)and(velocity[1] ==0)):
		anim.play("idle")
	elif (velocity[0]>0):
		anim.play("walk_right")
	elif (velocity[0]<0):
		anim.play("walk_left")
	elif (velocity[1]>0):
		anim.play("walk_down")
	elif (velocity[1]<0):
		anim.play("walk_up")
	else:
		anim.stop()

func _physics_process(_delta):
	get_input()
	move_and_slide()


func _on_door_body_entered(_body):
	await get_tree().physics_frame
	get_tree().change_scene_to_file("res://maps/map_1.tscn")


func _on_table_body_entered(_body):
	($dialogue_out/DialogueBox/VBoxContainer/Label as Label).visible=true
	($dialogue_out/EzDialogue as EzDialogue).start_dialogue(study_dialogue,state)


func _on_school_body_entered(_body):
	($dialogue_out/DialogueBox/VBoxContainer/Label as Label).visible=true
	($dialogue_out/EzDialogue as EzDialogue).start_dialogue(marks_dialogue,state)


func _on_tennis_friend_body_entered(_body):
	($dialogue_out/DialogueBox/VBoxContainer/Label as Label).visible=true
	($dialogue_out/EzDialogue as EzDialogue).start_dialogue(tennis_dialogue,state)


func _on_mom_call_body_entered(_body):
	($dialogue_out/DialogueBox/VBoxContainer/Label as Label).visible=true
	($dialogue_out/EzDialogue as EzDialogue).start_dialogue(mom_dialogue,state)
