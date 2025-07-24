extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

@export var stage_modulate_component: Node

func _connect_state_signals():
	owner.connect("mouse_exited", _on_mouse_exit)
	owner.connect("mouse_clicked", _on_click)

func _disconnect_state_signals():
	owner.disconnect("mouse_exited", _on_mouse_exit)
	owner.disconnect("mouse_clicked", _on_click)

func enter_state(_prev_state, _new_state):
	
	is_current_state = true
	
	stage_modulate_component.set_modulate_hover()
	
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)

func _on_mouse_exit():
	_transition(state_machine.idle)

func _on_click():
	_transition(state_machine.selected)
