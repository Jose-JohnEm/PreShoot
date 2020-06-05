extends TextureButton

onready var back = get_parent().get_node("Back")

func _on_Return_pressed():
	#back.play()
	get_tree().change_scene("res://Scenes/Menu.tscn")
