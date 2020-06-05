extends TextureButton

var unlocked = true

func _on_Level9_pressed():
	if unlocked: get_tree().change_scene("res://Scenes/Maps/Level 9.tscn")
