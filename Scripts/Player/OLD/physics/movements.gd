extends KinematicBody2D

export var puissance_saut = -600
export var vitesse = 200

func move_in_ x(current_key):
	if current_key == "right":
		return (vitesse)
	elif current_key == "left":
		return (-vitesse)
	else:
		return (0)

func move_in_ y(current_key):
	print("TRUE")
	if current_key == "ui_up" and is_on_floor() == true:
		return puissance_saut
	else:
		return motion.y
