extends KinematicBody2D

var motion = Vector2()
var status = "recording"
var stock_moves = [[]]
var Timer = 0

const UP = Vector2(0, -1)

# Reload the level when the player fall or when the reload button is pressed
func reload_scene(fall):
	if Input.is_action_just_pressed("ui_reload") or fall > 2000:
		get_tree().reload_current_scene()


func _physics_process(delta):
	gravity()
	check_sequence(status, delta)
	animation(motion)
	move_and_slide(motion, UP)
	reload_scene(motion.y)
