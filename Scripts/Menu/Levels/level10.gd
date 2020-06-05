extends TextureButton

var unlocked = true

func _on_Level10_pressed():
	if unlocked: get_tree().change_scene("res://Scenes/Maps/Level 10.tscn")
