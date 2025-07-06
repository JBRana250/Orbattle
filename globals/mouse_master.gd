extends Node2D

@export var cursor_hover_over_control_resource: CursorHoverOverControlResource


# If mouse is inside an important control, returns true. Otherwise, returns false.
func _check_mouse_control_overlap() -> bool: 
	var mousePos = get_viewport().get_mouse_position()
	for control in cursor_hover_over_control_resource.important_controls:
		var rect = control.get_rect()
		var control_canvas_transform = control.get_global_transform_with_canvas()
		rect.position = Vector2(control_canvas_transform.origin.x, control_canvas_transform.origin.y) 
		if rect.has_point(mousePos):
			return true
	return false

# If mouse is inside any area or body, returns the results. otherwise, returns an empty array.
func _check_mouse_overlap() -> Array[Dictionary]:
	 # get the Physics2DDirectSpaceState object
	var space = get_world_2d().direct_space_state
	# Get the mouse's position
	var mousePos = get_global_mouse_position()
	var param = PhysicsPointQueryParameters2D.new()
	
	param.collide_with_areas = true
	param.collide_with_bodies = false
	param.position = mousePos
	
	# Check if there is a collision at the mouse position
	var results = space.intersect_point(param, 1)
	if results:
		return results
	else:
		return []
