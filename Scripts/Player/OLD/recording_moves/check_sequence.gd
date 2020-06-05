extends KinematicBody2D

func check_status():
	if Input.is_action_just_pressed("ui_accept"):
		Timer = stock_moves[0][0]
		print ("Play mode activé !")
		print (stock_moves)
		return "play"
	return "recording"

func check_sequence(status, delta):
	if status == "recording":
		stock_moves = recording_time(stock_moves, Timer, delta)
		status = check_status(Timer, stock_moves)
	elif status == "play":
		status = play_moves(stock_moves)
		Timer += 1 * delta
