extends Node


var cursor = load("res://graphics/ui/crosshair159.png")

func _ready():
	Input.set_custom_mouse_cursor(cursor)
