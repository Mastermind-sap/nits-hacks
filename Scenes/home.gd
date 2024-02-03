extends Node2D

@export var dialogue_json:JSON
@onready var state={
	"player_name":"Saptarshi"
}
# Called when the node enters the scene tree for the first time.
func _ready():
	($Player/dialogue_out/DialogueBox/VBoxContainer/Label as Label).visible=true
	($Player/dialogue_out/EzDialogue as EzDialogue).start_dialogue(dialogue_json,state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
