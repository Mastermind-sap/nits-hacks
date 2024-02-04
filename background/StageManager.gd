extends CanvasLayer

const HOME=("res://Scenes/home.tscn")
const MAP1=("res://maps/map_1.tscn")

func _ready():
	get_node("ColorRect").hide()
	get_node("Label").hide()
	
func changeStage(stage_path):
	get_node("ColorRect").show()
	get_node("Label").show()
	get_node("anim").play("TransIn")
	await get_node("anim").animation_finished
	
	#var stage=load(stage_path).instantiate()
	#get_tree().get_root().get_child(2).free()
	#get_tree().get_root().add_child(stage)
	get_tree().change_scene_to_file(stage_path)
	#if stage.has_node("Player"):
		#stage.get_node("Player").position=Vector2(x,y)
	
	
	get_node("anim").play("TransOut")
	await get_node("anim").animation_finished
