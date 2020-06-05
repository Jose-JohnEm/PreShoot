extends TextureButton

var unlocked = true

func _on_Level4_pressed():
	if unlocked: get_tree().change_scene("res://Scenes/Maps/Level 4.tscn")
