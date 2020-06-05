extends KinematicBody2D

onready var lives = get_node("Lives")
onready var sfx = get_parent().get_node("SFX")
onready var lvl = get_parent().get_node("Start position")

var motion = Vector2()
var status = "recording"
var stock_moves = [[], []]
var Timer = 0
var x_time = 0
var game_type = "level"
var fall = false
var can_reload = true
var allow_play = false

var map = true

const UP = Vector2(0, -1)
export var gravity = 20
export var puissance_saut = -600
export var vitesse = 200

func move_in_x(current_key):
	if current_key == "right":
		return (vitesse)
	elif current_key == "left":
		return (-vitesse)
	else:
		return (0)

func move_in_y(current_key):
	if current_key == "up" and is_on_floor() == true:
		motion.y = puissance_saut

func do_jump():
	if motion.y < 2:
		$Sprite.play("Jump")
	if motion.y > -2:
		$Sprite.play("Fall")

func jump_gestion():
	if is_on_wall() == true:
		motion.x = 0
	if is_on_floor() == false:
		do_jump()
		return true
	return false

func run_gestion():
	if motion.x != 0: $Sprite.play("Run")
	if motion.x > 0: $Sprite.flip_h = false
	elif motion.x < 0: $Sprite.flip_h = true
	elif status != "end" and motion.x == 0: $Sprite.play("Idle")
	elif status == "end" and motion.x == 0: $Sprite.play("Dead")

func restart_scene():
	sfx.fail()
	status = "recording"
	self.position = lvl.position
	stock_moves[0].clear()
	stock_moves[1].clear()
	x_time = 0
	Timer = 0
	motion = Vector2(0, 0)
	move_and_slide(motion, UP)

func reload_scene():
	if can_reload == false:
		return
	if Input.is_action_just_pressed("ui_reload") or (fall == true and lives.live > 0 and status != "recording") or (self.position.y > 1100 and game_type == "level"):
		allow_play = false
		status = "end"
		if game_type == "endless":
			if lives.live > 0:
				lives.death()
			else:
				lives.live = 3
				get_tree().reload_current_scene()
		else:
			restart_scene()
			
func manage_view():
	if game_type == "endless":
		$UI/ReloadButton.show()
		$UI/LaunchButton.show()
		$UI/Commands/LeftButton.show()
		$UI/Commands/UpButton.show()
		$UI/Commands/RightButton.show()
		$UI/CameraButton.hide()
		map = true
		return
	if Input.is_action_just_pressed("ui_cam"):
		if map == true:
			$UI/ReloadButton.hide()
			$UI/LaunchButton.hide()
			$UI/Commands/LeftButton.hide()
			$UI/Commands/UpButton.hide()
			$UI/Commands/RightButton.hide()
			$UI/Commands/RightCamButton.show()
			$UI/Commands/LeftCamButton.show()
			get_parent().get_node("CamMap").make_current()
			map = false
		else:
			$UI/Commands/RightCamButton.hide()
			$UI/Commands/LeftCamButton.hide()
			$UI/ReloadButton.show()
			$UI/LaunchButton.show()
			$UI/Commands/LeftButton.show()
			$UI/Commands/UpButton.show()
			$UI/Commands/RightButton.show()
			$CamPlayer.make_current()
			map = true

func _physics_process(delta):
	check_sequence(status, delta)
	animation()
	gravity()
	move_and_slide(motion, UP)
	reload_scene()
	manage_view()

func a_move():
	if Input.is_action_just_pressed("ui_right"):
		return "right"
	if Input.is_action_just_pressed("ui_left"):
		return "left"
	if Input.is_action_just_pressed("ui_up"):
		return "up"
	return "none"

func record_moves():
	$Sprite.play("Idle")
	var key = a_move()
	if key != "none":
		stock_moves[0].append(round(Timer * 1000) / 1000)
		stock_moves[1].append(key)
		allow_play = true

func play_moves():
	if x_time == len(stock_moves[0]) or len(stock_moves[0]) == 0:
		status = "end"
		return
	if round(Timer * 1000) / 1000 >= stock_moves[0][x_time]:
		motion.x += move_in_x(stock_moves[1][x_time])
		move_in_y(stock_moves[1][x_time])
		x_time += 1

func gravity():
	if is_on_floor() == false:
		motion.y += gravity
	elif motion.y > 20:
		motion.y = 20


func check_status():
	if Input.is_action_just_pressed("ui_accept") and allow_play == true:
		Timer = stock_moves[0][0]
		status = "play"

func check_sequence(status, delta):
	if status == "recording":
		$Sprite.play("Idle")
		recording_time(delta)
		check_status()
	elif status == "play":
		status = play_moves()
		Timer += 1 * delta


func recording_time(delta):
	record_moves()
	Timer += 1 * delta


func animation():
	if jump_gestion() == true:
		return
	run_gestion()
	
func checkpoint_past():
	var x = len(stock_moves[0]) - 1
	status = "recording"
	x_time = 0
	while x >= 0:
		stock_moves[0].remove(x)
		stock_moves[1].remove(x)
		x -= 1
	allow_play = false
	Timer = 0
	move_and_slide(motion, UP)
