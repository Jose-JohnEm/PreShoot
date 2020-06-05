extends TextureButton

onready var music = get_parent().get_node("MusicMenu")

var music_status = 1

var sprite_off = preload("res://Resources/Menu/music_off.png")
var sprite_on = preload("res://Resources/Menu/music_on.png")

func _on_VolumeButton_pressed():
	if (music_status == 1):
		music_status = 0
	else:
		music_status = 1
	if music_status == 1:
		music.stream_paused = 0
		self.texture_normal = sprite_on
	else:
		music.stream_paused = 1
		self.texture_normal = sprite_off
