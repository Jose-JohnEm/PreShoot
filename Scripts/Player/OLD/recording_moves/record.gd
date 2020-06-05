extends KinematicBody2D

func recording_time(Timer, stock_moves):
	stock_moves = record_moves(stock_moves, delta)
	Timer += 1 * delta
	return stock_moves
