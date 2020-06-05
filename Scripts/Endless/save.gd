extends Node2D

onready var nw_score = get_node("Dog/Lives")
onready var sfx = get_node("Camera2D/New_score")

var record = -1
var path = "user://save.prs"
var config = ConfigFile.new()
var load_response = config.load(path)

func _ready():
	if config.get_value("Endless", "Score") == null:
		save_best_score(-1)
	print(config.get_value("Endless", "Score"))
	
func _physics_process(delta):
	record = config.get_value("Endless", "Score")

func save_best_score(score):
	var file = File.new()
	file.open(path, File.WRITE)
	config.set_value("Endless", "Score", score)
	config.save(path)
	
func check_best_score(score):
	if score > config.get_value("Endless", "Score"):
		save_best_score(score)
		sfx.high_score_reached()
