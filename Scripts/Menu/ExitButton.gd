extends TextureButton

onready var back = get_parent().get_node("Node/Back")
onready var menu = get_parent().get_node("MusicMenu")

func _on_ExitButton_pressed():
	menu.stop()
	back.play()

func _physics_process(delta):
	if back.get_playback_position() > 1:
		get_tree().quit()
