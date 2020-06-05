extends TextureButton

var unlocked = true

func _on_Level1_pressed():
	if unlocked: get_tree().change_scene("res://Scenes/Maps/Level 1.tscn")
