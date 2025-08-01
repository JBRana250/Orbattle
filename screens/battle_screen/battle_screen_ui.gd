extends Node

func _ready():
	MouseMaster.cursor_sprite_master.connect("cursor_to_arrow", _on_cursor_to_arrow)
	MouseMaster.cursor_sprite_master.connect("cursor_to_point", _on_cursor_to_point)
	MouseMaster.cursor_sprite_master.connect("cursor_to_drag", _on_cursor_to_drag)

func _on_cursor_to_arrow():
	self.mouse_default_cursor_shape = Input.CURSOR_ARROW

func _on_cursor_to_point():
	self.mouse_default_cursor_shape = Input.CURSOR_POINTING_HAND

func _on_cursor_to_drag():
	self.mouse_default_cursor_shape = Input.CURSOR_DRAG
