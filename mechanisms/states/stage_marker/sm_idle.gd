extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

@export var stage_modulate_component: Node

func _connect_state_signals():
	owner.connect("mouse_entered", _on_mouse_hover)

func _disconnect_state_signals():
	owner.disconnect("mouse_entered", _on_mouse_hover)

func enter_state(_prev_state, _new_state):
	
	is_current_state = true
	
	stage_modulate_component.set_modulate_default()
	if owner in owner.stage_select_ui.current_region_markers:
		owner.stage_select_ui.current_region_markers.erase(owner)
		owner.stage_select_ui.on_array_modified()
	
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)

func _on_mouse_hover():
	_transition(state_machine.hover)
