extends Node

signal diamond_updated

var best_times := 0.0
var best_diamonds := 0

var total_times := 0.0
var total_diamonds := 0

var diamonds: int = 0:
	set(value):
		diamonds = value
		diamond_updated.emit(diamonds)
