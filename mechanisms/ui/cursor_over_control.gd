extends Control

@export var cursor_hover_over_control_resource: CursorHoverOverControlResource

func _ready():
	cursor_hover_over_control_resource.important_controls.append(self)
