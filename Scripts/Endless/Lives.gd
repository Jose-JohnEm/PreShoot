extends Node2D

onready var player = get_parent().get_parent().get_node("Dog")
onready var camera =  get_parent().get_parent().get_node("Camera2D")
onready var font =  get_parent().get_parent().get_node("Camera2D/Font")
onready var hud = get_parent().get_node("Lives")
onready var lvl = get_parent().get_parent().get_node("Camera2D/Level_music")
onready var min_one = get_parent().get_parent().get_node("Camera2D/-1")
onready var save = get_parent().get_parent().get_node(".")


onready var live = 3

func _ready():
	live = 3

func _physics_process(delta):
	if camera.zone[0] > 1 and live > 0:
		player.fall = do_player_failed()
	if camera.zone[0] == 1:
		player.can_reload = false
	else:
		player.can_reload = true

func do_player_failed():
	if player.position.x > camera.position.x and player.position.x < camera.position.x + 1024:
		if player.position.y > camera.position.y - 100 and player.position.y < camera.position.y + 600:
			return false
	return true

func game_over():
	save.check_best_score(camera.zone[0] - 2)
	camera.smoothing_enabled = true
	camera.smoothing_speed = 2
	camera.zoom.x = camera.zone[0] * 0.5
	camera.zoom.y = camera.zone[0] * 0.5
	font.scale = camera.zoom * 4
	font.z_index = -5
	camera.position = Vector2(0, -77 * camera.zone[0] * (camera.zone[0] / 2))

func death():
	var p_check = get_parent().get_parent().get_node("Generation/CP").player_position
	live -= 1
	if live == 0:
		game_over()
		return
	player.position = p_check
	lvl.stream_paused = true
	min_one.play()
	player.motion = Vector2(0, 0)
	player.stock_moves[0].clear()
	player.stock_moves[1].clear()
	player.x_time = 0
	player.status = "recording"
