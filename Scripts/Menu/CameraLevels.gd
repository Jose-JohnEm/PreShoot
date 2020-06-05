extends Camera2D

func _ready():
	set_process(true)
	
func _process(delta):
	var position = get_camera_position()
	set_position(Vector2(position.x + 3, position.y))
