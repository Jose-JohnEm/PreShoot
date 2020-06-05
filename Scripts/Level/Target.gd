extends Node2D

onready var save = get_parent().get_node(".")
onready var lvl = get_parent().get_node("SFX/Level")
onready var sprite = get_parent().get_node("Sprite")
onready var anim = get_parent().get_node("Sprite/Sprite")

var timer = 0
var end = false

func level_cleared_animation():
	$Label.visible = true
	lvl.stop()
	sprite.status = "end"
	sprite.stock_moves[0].clear()
	sprite.stock_moves[1].clear()
	sprite.x_time = 0
	sprite.Timer = 0
	sprite.motion.x = 0

func _physics_process(delta):
	timer += delta
	if end == true:
		anim.play("Idle")
		level_cleared_animation()
		if $Victory.get_playback_position() > 5:
			save.increase_max_level()
			save.load_max_level()
#			get_tree().change_scene("res://Scenes/Levels.tscn")


func _on_Area2D_body_entered(body):
	if body == get_parent().get_node("Sprite"):
		end = true
		$Victory.play()
