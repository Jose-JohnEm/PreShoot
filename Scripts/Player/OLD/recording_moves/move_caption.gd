extends KinematicBody2D

func a_move():
	if Input.is_action_just_pressed("ui_right"):
		return "right"
	if Input.is_action_just_pressed("ui_left"):
		return "left"
	if Input.is_action_just_pressed("ui_up"):
		return "up"
	return "none"

func record_moves(stock_moves):
	$Sprite.play("stopped")
	var key = a_move()
	if key != "null":
		stock_moves[0].append(round(Timer * 1000) / 1000)
		stock_moves[1].append(key)
		return stock_moves
