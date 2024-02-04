extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge the\nNegative Emotions"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()
	$EndButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	$EndButton.hide()
	start_game.emit()


func _on_MessageTimer_timeout():
	$MessageLabel.hide()


func _on_end_button_pressed():
	$StartButton.hide()
	$EndButton.hide()
	await get_tree().physics_frame
	get_tree().change_scene_to_file("res://maps/map_1.tscn")
