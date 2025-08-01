extends Node

@export var default_modulate: Color
@export var hover_modulate: Color
@export var selected_modulate: Color

func set_modulate_default():
	owner.modulate = default_modulate

func set_modulate_hover():
	owner.modulate = hover_modulate

func set_modulate_selected():
	owner.modulate = selected_modulate
