extends Node

# Region Markers will add and remove themselves to this array.
@export var current_region_markers: Array[Node]

# This function NEEDS to be called whenever the above array is modified
func on_array_modified():
	if current_region_markers.is_empty():
		self.visible = false
	else:
		self.visible = true
