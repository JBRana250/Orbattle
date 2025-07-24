extends Node

signal mouse_entered
signal mouse_exited
signal mouse_clicked
signal clicked_elsewhere

@export var hover: bool = false:
	set(value):
		if hover == value:
			return
		hover = value
		if hover == true:
			mouse_entered.emit()
		else:
			mouse_exited.emit()
