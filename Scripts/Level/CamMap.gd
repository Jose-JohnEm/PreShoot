extends Camera2D

var cam_motion = Vector2()
var cam_pos = self.position.x
var right_limit = get_limit(MARGIN_RIGHT)

var speed = 10

func _process(delta):
	cam_pos = self.position.x
	if Input.is_action_pressed("ui_left_cam") and cam_pos >= speed:
		self.position.x -= speed
	if Input.is_action_pressed("ui_right_cam") and (self.position.x + 1920) < right_limit:
		self.position.x += speed
