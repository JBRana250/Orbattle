extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

@export var stage_modulate_component: Node

func _connect_state_signals():
	owner.connect("clicked_elsewhere", _on_clicked_elsewhere)

func _disconnect_state_signals():
	owner.disconnect("clicked_elsewhere", _on_clicked_elsewhere)

func enter_state(_prev_state, _new_state):
	
	is_current_state = true
	
	stage_modulate_component.set_modulate_selected()
	
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)

func _on_clicked_elsewhere():
	_transition(state_machine.idle)
