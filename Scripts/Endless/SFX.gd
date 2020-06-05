extends Node

func fail():
	$Level.stream_paused = true
	$Fail.play()

func _physics_process(delta):
	if $Fail.get_playback_position() > 1:
		$Fail.stop()
		$Level.stream_paused = false
