extends Node

@export var zoomed_in_value: Vector2
@export var tween_duration: float

# Make it so that the camera zooms in on the stage on select
func zoom_in_on_self():
	_start_tween(owner.camera, "position", owner.position, tween_duration)
	_start_tween(owner.camera, "zoom", zoomed_in_value, tween_duration)

func _start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)
