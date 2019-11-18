extends KinematicBody2D

export (float) var jump_force = 512.0
export (float) var base_gravity = 45.0
export (float) var jump_gravity = 20.0

var gravity = base_gravity
var velocity = Vector2()
var base_snap_vector = Vector2(0, 8)
var snap_vector = base_snap_vector

func _process(delta):
	if is_on_floor():
		velocity.y = 0.1
		if Input.is_action_just_pressed("jump"):
			snap_vector = Vector2()
			velocity.y = -jump_force
	else:
		if Input.is_action_pressed("jump"):
			gravity = jump_gravity
		else:
			gravity = base_gravity
		if velocity.y >= 0:
			gravity = base_gravity
		snap_vector = base_snap_vector
		velocity.y += gravity
	
	move_and_slide_with_snap(velocity, snap_vector, Vector2(0, -1))


func _on_Area2D_area_entered(area):
	Score.clear()
