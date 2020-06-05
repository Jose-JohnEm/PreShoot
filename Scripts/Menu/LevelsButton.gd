extends TextureButton

onready var select = get_parent().get_node("Node/Select")

func _on_LevelsButton_pressed():
	select.play()
	get_tree().change_scene("res://Scenes/Levels.tscn")
