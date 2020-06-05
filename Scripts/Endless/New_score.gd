extends AudioStreamPlayer

onready var level_music = get_parent().get_node("Level_music")

func _physics_process(delta):
	if get_playback_position() > 4.5:
		end()


func end():
	self.stop()
	level_music.stream_paused = false

func high_score_reached():
	level_music.stream_paused = true
	self.play()
