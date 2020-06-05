extends KinematicBody2D

func animation(motion):
	if jump_gestion(motion) == true:
		return
	run_gestion(motion)
