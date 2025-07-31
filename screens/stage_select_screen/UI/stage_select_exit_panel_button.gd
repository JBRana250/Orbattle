extends Node

func _on_pressed() -> void:
	# This will just put the markers back to idle state.
	for marker in owner.current_region_markers:
		marker.clicked_elsewhere.emit()
		
	owner.current_region_markers.clear()
	owner.on_array_modified()
