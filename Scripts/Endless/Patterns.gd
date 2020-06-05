extends Node2D

onready var difficult = 1

var cam
var rand = RandomNumberGenerator.new()

func create_on(x, y):
	var block = load("res://Scenes/Sub-scenes/crate.tscn").instance()
	get_parent().get_parent().add_child(block)
	block.position = cam + Vector2(x * 77, y * 77)

func pat21():
	create_on(7, 4)
	create_on(8, 4)
	#Pilliers
	#1
	create_on(7, 5)
	create_on(8, 5)
	create_on(7, 6)
	create_on(8, 6)
	create_on(7, 7)
	create_on(8, 7)
	create_on(7, 8)
	create_on(8, 8)
	#2
	create_on(3, 6)
	create_on(4, 6)
	create_on(3, 7)
	create_on(4, 7)
	create_on(3, 8)
	create_on(4, 8)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
func pat22():
	create_on(7, 6)
	create_on(8, 6)
	#Pilliers
	#1
	create_on(7, 0)
	create_on(8, 0)
	create_on(7, 1)
	create_on(8, 1)
	create_on(7, 2)
	create_on(8, 2)
	create_on(7, 7)
	create_on(8, 7)
	create_on(7, 8)
	create_on(8, 8)
	create_on(7, 9)
	create_on(8, 9)
	#2
	create_on(3, 6)
	create_on(4, 6)
	create_on(3, 7)
	create_on(4, 7)
	create_on(3, 8)
	create_on(4, 8)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
func pat23():
	create_on(5, 8)
	create_on(6, 8)
	create_on(7, 8)
	create_on(8, 8)
	create_on(9, 8)
	create_on(10, 8)
	create_on(10, 6)
	create_on(8, 4)
	create_on(9, 3)
	create_on(9, 7)
	create_on(8, 3)
	create_on(10, 7)
	#Pilliers
	#1
	create_on(7, 3)
	create_on(7, 4)
	create_on(7, 5)
	#2
	for x in range(3, 10):
		for y in range(0, 3):
			create_on(x, y)
	
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
func pat24():
	#Pilliers
	#2
	create_on(3, 6)
	create_on(4, 6)
	create_on(3, 7)
	create_on(4, 7)
	create_on(3, 8)
	create_on(4, 8)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
func pat25():
	
	create_on(5, 4)
	create_on(6, 4)
	create_on(7, 4)
	create_on(6, 3)
	create_on(7, 3)
	create_on(7, 2)
	create_on(10, 7)
	
	create_on(9, 0)
	create_on(9, 1)
	create_on(9, 2)
	create_on(9, 3)
	create_on(9, 4)
	
	create_on(8, 8)
	create_on(9, 8)
	create_on(10, 8)
	#Pilliers
	#1
	for x in range(5, 8):
		for y in range(5, 9):
			create_on(x, y) 
		
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
func pat26():
	create_on(1, 3)
	create_on(2, 3)
	create_on(5, 2)
	create_on(6, 2)
	create_on(8, 1)
	create_on(9, 1)
	
	#Pilliers
	#1
	for x in range(5, 7):
		for y in range(3, 9):
			create_on(x, y)
	for x in range(8, 10):
		for y in range(2, 9):
			create_on(x, y)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)

func pat11():
	create_on(4, 8)
	create_on(5, 7)
	create_on(6, 6)
	create_on(7, 5)
	create_on(8, 4)
	create_on(9, 3)
	create_on(10, 2)
func pat12():
	create_on(4, 7)
	create_on(5, 7)
	create_on(6, 5)
	create_on(7, 5)
	create_on(8, 3)
	create_on(9, 3)
	create_on(10, 2)
func pat13():
	for i in range(5, 13):
		create_on(i, 8)
	for i in range(3, 8):
		create_on(12, i)
	create_on(10, 7)
	create_on(11, 7)

	create_on(6, 5)
	create_on(7, 5)

	create_on(3, 3)
	create_on(4, 3)
	
	create_on(2, 0)
	create_on(2, 1)
	create_on(2, 2)
	create_on(2, 3)
func pat14():
	for i in range(5, 13):
		create_on(i, 8)
	for i in range(3, 8):
		create_on(12, i)
	create_on(10, 7)
	create_on(11, 7)

	create_on(6, 5)
	create_on(7, 5)

	create_on(3, 3)
	create_on(4, 3)
	
	create_on(2, 0)
	create_on(2, 1)
	create_on(2, 2)
	create_on(2, 3)
func pat15():
	create_on(8, 7)
	create_on(9, 7)
	create_on(10, 6)
	create_on(11, 6)
	create_on(4, 4)
	create_on(3, 3)
	create_on(9, 2)
	create_on(10, 2)
func pat16():
	create_on(8, 7)
	create_on(9, 7)
	create_on(10, 6)
	create_on(11, 6)
	create_on(4, 4)
	create_on(3, 3)
	create_on(9, 2)
	create_on(10, 2)

func pat31():
	create_on(6, 4)
	create_on(7, 4)
	create_on(9, 6)
	create_on(10, 6)
func pat32():
	pass
func pat33():
	for x in range(11, 13):
		for y in range(0, 5):
			create_on(x, y)
	for x in range(3, 5):
		for y in range(2, 9):
			create_on(x, y)
	for i in range(5, 10):
		create_on(i, 2)
	for i in range(6, 11):
		create_on(i, 5)
	for i in range(5, 11):
		create_on(i, 8)
func pat34():
	for x in range(11, 12):
		for y in range(0, 5):
			create_on(x, y)
	create_on(9, 4)
	create_on(10, 4)
	create_on(5, 7)
	create_on(6, 7)
func pat35():
	for x in range(11, 13):
		for y in range(0, 5):
			create_on(x, y)
	for x in range(3, 5):
		for y in range(2, 9):
			create_on(x, y)
	create_on(7, 1)
	create_on(6, 5)
	create_on(8, 4)
	create_on(7, 6)
	create_on(9, 6)
func pat36():
	for y in range(0, 6):
		create_on(12, y)
	create_on(5, 2)
	create_on(6, 2)
	create_on(7, 2)
	create_on(10, 2)
	create_on(11, 5)
	create_on(10, 5)
	create_on(7, 5)
	create_on(6, 8)
	create_on(7, 8)
	create_on(8, 8)
	create_on(10, 8)

func select_pat1(i):
	if i == 1: pat11()
	if i == 2: pat12()
	if i == 3: pat13()
	if i == 4: pat14()
	if i == 5: pat15()
	if i == 6: pat16()
	create_on(3, 8)
	create_on(4, 8)

func select_pat2(i):
	if i == 1: pat21()
	if i == 2: pat22()
	if i == 3: pat23()
	if i == 4: pat24()
	if i == 5: pat25()
	if i == 6: pat26()
	create_on(3, 5)
	create_on(4, 5)

func select_pat3(i):
	if i == 1: pat31()
	if i == 2: pat32()
	if i == 3: pat33()
	if i == 4: pat34()
	if i == 5: pat35()
	if i == 6: pat36()
	create_on(3, 2)
	create_on(4, 2)

func find_path(i, j):
	if j == 1: select_pat1(i)
	if j == 2: select_pat2(i)
	if j == 3: select_pat3(i)

func pattern_gestion(cam_pos, way):
	cam = cam_pos
	rand.randomize()
	find_path(rand.randi_range(difficult, difficult + 1), way)
