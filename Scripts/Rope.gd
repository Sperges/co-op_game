extends Node2D

onready var anim = $AnimationPlayer
var velocity = 0.1

func increase_score():
	Score.increase()
	if Score.get_score() % 5 == 0 and Score.get_score() != 0:
		anim.playback_speed += velocity
		velocity += 0.05

func _ready():
	anim.current_animation = "swing"