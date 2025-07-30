extends TextureButton

@export var hovered_value: Vector2
@export var default_value: Vector2
@export var tween_duration: float

# Enables process whenever the value of hovered becomes true, and
# Disables process when the value becoems false.
var hovered = false:
	set(value):
		if hovered == value:
			return
		hovered = value
		if hovered == true:
			_tween_margins_to_value(hovered_value)
		else:
			_tween_margins_to_value(default_value)

func _tween_margins_to_value(value: Vector2):
	_start_tween(self, "scale", value, tween_duration)

# Creates an 'animation' that will interpolate a certain value for a certain duration on a certain object.
func _start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
