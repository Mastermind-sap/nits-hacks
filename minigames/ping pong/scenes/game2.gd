extends Sprite2D

var score := [0, 0]# 0:Player, 1: CPU
const PADDLE_SPEED : int = 500

func _on_ball_timer_timeout():
	$Ball.new_ball()

func _on_score_left_body_entered(body):
	score[1] += 1
	if score[1] > 1:
		gameOver()
	$Hud/CPUScore.text = "Friend "+str(score[1])
	$BallTimer.start()

func _on_score_right_body_entered(body):
	score[0] += 1
	if score[0] > 1:
		gameOver()
	$Hud/PlayerScore.text = "You "+str(score[0])
	$BallTimer.start()

func gameOver():
	await get_tree().physics_frame
	get_tree().change_scene_to_file("res://maps/map_1.tscn")
	
	
