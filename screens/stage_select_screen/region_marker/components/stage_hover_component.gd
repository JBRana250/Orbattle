extends Node

func _on_stage_marker_area_mouse_entered() -> void:
	owner.hover = true

func _on_stage_marker_area_mouse_exited() -> void:
	owner.hover = false
