extends AudioStreamPlayer

onready var lives = get_parent().get_parent().get_node("Dog/Lives")

func _ready():
	self.bus = "Level"

func _physics_process(delta):
	
	if lives.live != null and lives.live == 0:
		self.bus = "End of Level"
	else:
		self.bus = "Level"
