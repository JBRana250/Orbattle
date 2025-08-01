extends ScrollContainer

func _ready():
	var v_scrollbar = get_v_scroll_bar()
	v_scrollbar.set_default_cursor_shape(Control.CURSOR_POINTING_HAND)
