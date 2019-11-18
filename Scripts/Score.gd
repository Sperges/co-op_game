extends Node

var score = 0

func increase():
	score += 1

func clear():
	score = 0

func get_score():
	return score