extends KinematicBody2D

func do_jump(motion):
	if motion.y < 2:
		$Sprite.play("jump")
	if motion.y > -2:
		$Sprite.play("fall")

func jump_gestion(motion):
	if is_on_wall() == true:
		motion.x = 0
	if is_on_floor() == false:
		do_jump(motion)
		return true
	return false
