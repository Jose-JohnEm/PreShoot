extends Node

onready var save = get_parent().get_node(".")

var time = 0

func lock_levels():
	var node
	for i in range(1, save.cur_level):
		node = get_parent().get_node("Level" + str(i))
		node.texture_normal = load("res://Resources/Menu/Levels/Orange_bubble" + str(i) + ".png")
		node.texture_pressed = load("res://Resources/Menu/Levels/Grey_bubble" + str(i) + ".png")
		node.texture_hover = load("res://Resources/Menu/Levels/Grey_bubble" + str(i) + ".png")
	for i in range(save.cur_level + 1, 10 + 1):
		node = get_parent().get_node("Level" + str(i))
		node.unlocked = false
		node.texture_normal = load("res://Resources/Menu/Levels/Grey_unlock.png")
		node.texture_pressed = load("res://Resources/Menu/Levels/Grey_unlock.png")
		node.texture_hover = load("res://Resources/Menu/Levels/Grey_unlock.png")

func _physics_process(delta):
	time += delta
	if time < 0.5:
		lock_levels()
