extends Label

onready var lives = get_parent().get_parent().get_node("Dog/Lives")
onready var camera = get_parent().get_parent().get_node("Camera2D")
onready var pattern = get_parent().get_parent().get_node("Generation/CP/Patterns")
onready var more_life = get_parent().get_node("5+")
onready var lvl = get_parent().get_node("Level_music")
onready var record = get_parent().get_parent().get_node(".")

onready var timer = 0
var minus_one = false

func increase_lvl():
	more_life.play()
	lvl.stream_paused = true
	lives.live += 1

func in_game_display():
	self.text = "Shoots : " + str(lives.live) + "\nScore : " + str(camera.zone[0] - 2)
	self.get_font("font").size = 30
	
func best_or_not(score):
	if score <= record.record:
		return "\nRecord : " + str(record.record)
	else:
		return "\nNew best record !!!"

func text_handle():
	if lives.live > 0 and camera.zone[0] > 1: in_game_display()
	elif camera.zone[0] == 1:
		pass
	else:
		self.text = "Score : " + str(camera.zone[0] - 2) + best_or_not(camera.zone[0] - 2)
		self.get_font("font").size = 50 * camera.zone[0]

func _physics_process(delta):
	timer += delta
	text_handle()
