extends TextureButton

onready var select = get_parent().get_node("Node/Select")
onready var save = get_parent().get_node(".")

func _on_PlayButton_pressed():
	select.play()
	print("CLICK")
	save.load_max_level()
#	get_tree().change_scene("res://Scenes/Maps/Level 1.tscn")
