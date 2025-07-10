extends Node2D

@export var current_drag_card_resource: CurrentDragCardResource

@export var area_2d: Area2D

@export var encloses_card_component: Node2D

func _check_intersection_results(results) -> bool:
	if results.is_empty():
		return false
	for result in results:
		if result["collider"] == area_2d:
			return true
	return false

func _physics_process(_delta):
	if not current_drag_card_resource.is_dragging:
		return
	var results = MouseMaster._check_mouse_overlap()
	var check_intersection_results:bool = _check_intersection_results(results)
	var mouse_overlap_results:bool = MouseMaster._check_mouse_control_overlap()
	
	if !current_drag_card_resource.current_drag_node:
		return
	
	var current_card: Node2D = current_drag_card_resource.current_drag_node
	
	if check_intersection_results == true and mouse_overlap_results == false:
		
		current_card.is_hovering_over_battlefield = true
		var validity = encloses_card_component.calculate_enclosed()
		current_drag_card_resource.valid_placement = validity
		current_drag_card_resource.valid_placement_set.emit()
		
	else:
		
		current_card.is_hovering_over_battlefield = false

func _on_area_2d_mouse_entered() -> void:
	if not current_drag_card_resource.is_dragging:
		return
		
	var current_card: Node2D = current_drag_card_resource.current_drag_node
	
	current_card.is_hovering_over_battlefield = true

func _on_area_2d_mouse_exited() -> void:
	if not current_drag_card_resource.is_dragging:
		return
	
	var current_card: Node2D = current_drag_card_resource.current_drag_node
	
	current_card.is_hovering_over_battlefield = false
