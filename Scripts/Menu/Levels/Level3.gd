extends TextureButton

var unlocked = true

func _on_Level3_pressed():
	if unlocked: get_tree().change_scene("res://Scenes/Maps/Level 3.tscn")
