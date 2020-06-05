extends Node2D

var cur_level = 0
var lvls = ["tuto", "Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Level 10",]
var path = "user://save.prs"
var config = ConfigFile.new()
var load_response = config.load(path)

func _ready():
	if config.get_value("Classic", "Level") == null or config.get_value("Classic", "Level") < 0:
		set_max_level(0)
	print(config.get_value("Classic", "Level"))
	
func _physics_process(delta):
	cur_level = config.get_value("Classic", "Level")

func set_max_level(value):
	config.set_value("Classic", "Level", value)
	config.save(path)

func increase_max_level():
	if get_tree().current_scene.filename == "res://Scenes/Maps/" + lvls[cur_level] + ".tscn":
		config.set_value("Classic", "Level", cur_level + 1)
		cur_level += 1
	print("current level = ", get_tree().current_scene.filename)
	print("last level = ", "res://Scenes/Maps/" + lvls[cur_level] + ".tscn")
	config.save(path)

func load_max_level():
	get_tree().change_scene("res://Scenes/Maps/" + lvls[cur_level] + ".tscn")
	print("res://Scenes/Maps/" + lvls[cur_level] + ".tscn")
