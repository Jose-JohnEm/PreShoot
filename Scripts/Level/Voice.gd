extends AudioStreamPlayer

var end = false
onready var lvl = get_parent().get_node("SFX/Level")

func _physics_process(delta):
	if end == false and self.get_playback_position() > 58:
		self.stop()
		lvl.play()
		end = true
