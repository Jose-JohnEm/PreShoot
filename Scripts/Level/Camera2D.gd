extends Camera2D

onready var pattern = get_parent().get_node("Generation/CP/Patterns")
onready var cp = get_parent().get_node("Generation/CP")
onready var player = get_parent().get_node("Dog")
onready var label = get_parent().get_node("Camera2D/Shoots")
onready var zone = [1, 0, 0]
onready var times = 0

var margin = 0
var way_tmp = 2

func move_tab(way):
	if way == 1:
		zone[0] += 1
		zone[1] += 1
	if way == 2: zone[0] += 1
	if way == 3:
		zone[0] += 1
		zone[2] += 1
	if zone[0] != 2 and (zone[0] - 2) % 5 == 0:
		pattern.difficult += 1
		label.increase_lvl()

func trans_way(way):
	if way == 1: return 1 * 77
	if way == 2: return 4 * 77
	if way == 3: return 7 * 77

func trans_play(way):
	if way == 1: return 7 * 77
	if way == 2: return 4 * 77
	if way == 3: return 1 * 77

func go_dir(way):
	if way == 1: return -231
	if way == 2: return 0
	if way == 3: return 231

func change_camera(way):
	times += 1
	self.position.y -= margin
	if way_tmp == 1: self.position.y -= 231 * 2
	if way_tmp == 3: self.position.y += 231 * 2
	margin = go_dir(way)
	self.position.x += 616
	self.position.y += margin
	cp.position = self.position + Vector2(11 * 77 + 40, trans_way(way) + 12)
	player.position = self.position + Vector2(3 * 77, trans_play(way))
	way_tmp = way
	move_tab(way)
