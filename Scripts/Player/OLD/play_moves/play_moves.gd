extends KinematicBody2D

var x_time = 0

func rnd(timer):
    return round(timer * 1000) / 1000

func play_moves(stock_moves, Timer):
	if x_time == len(stock_moves[0]) or len(stock_moves[0]) == 0:
		print("FIN!!")
		return "end"
	if rnd(Timer) >= stock_moves[0][x_time]:
		printt(stock_moves[0][x_time], stock_moves[1][x_time])
		motion.x += move_in_x(stock_moves[1][x_time])
		motion.y = move_in_y(stock_moves[1][x_time])
		x_time += 1
        return "playing"