extends Label

onready var lives = get_parent().get_parent().get_node("Dog/Lives")
onready var camera = get_parent().get_parent().get_node("Camera2D")

func _physics_process(delta):
	if camera.zone[0] >= 1:
		self.text = "Score : " + str(camera.zone[0] - 1)
		if lives.live > 0:
			pass
		else:
			pass
