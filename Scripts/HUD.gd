extends CanvasLayer

signal start_game

func show_message(text):
	$message_lb.text = text
	$message_lb.show()
	$message_timer.start()

func show_game_over():
	show_message("Game Over")
	yield($message_timer, "timeout")
	$message_lb.text = "Dodge the\nCreeps!"
	$message_lb.show()
	yield(get_tree().create_timer(1), 'timeout')
	$start_btn.show()

func update_score(score):
	$score_lb.text = str(score)

func _on_message_timer_timeout():
	$message_lb.hide()


func _on_start_btn_pressed():
	$start_btn.hide()
	emit_signal("start_game")
	
	
