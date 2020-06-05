extends KinematicBody2D

func run_gestion(motion):
	if motion.x > 0:
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif motion.x < 0:
		$Sprite.flip_h = true
		$Sprite.play("run")
	elif fin_du_jeu == false:
		$Sprite.play("stopped")
	else:
		$Sprite.play("dead")
