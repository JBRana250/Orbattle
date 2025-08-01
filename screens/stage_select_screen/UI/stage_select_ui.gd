extends Node

@export var camera: Camera2D
@export var default_position: Vector2
@export var zoom_default_value: Vector2

@export var tween_duration: float

# Region Markers will add and remove themselves to this array.
@export var current_region_markers: Array[Node]

@export var fully_transparent_modulate: Color
@export var fully_opaque_modulate: Color

# This function NEEDS to be called whenever the above array is modified
func on_array_modified():
	if current_region_markers.is_empty():
		self.visible = false
		self.modulate = fully_transparent_modulate
		zoom_out_to_full()
	else:
		self.visible = true
		_start_tween(self, "modulate", fully_opaque_modulate, tween_duration)

func zoom_out_to_full():
	_start_tween(camera, "position", default_position, tween_duration)
	_start_tween(camera, "zoom", zoom_default_value, tween_duration)
	
func _start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(object, property, final_val, duration)
