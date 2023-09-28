extends Node

signal diamond_updated

var diamonds: int = 0:
	set(value):
		diamonds = value
		diamond_updated.emit(diamonds)
