extends KinematicBody2D

export var gravity = 20

func gravity():
	if is_on_floor() == false:
		motion.y += gravity
	elif motion.y < 20:
		motion.y = 20
