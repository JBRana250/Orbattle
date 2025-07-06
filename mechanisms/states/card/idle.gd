extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

func _connect_state_signals():
	owner.connect("started_dragging", _on_start_dragging)

func _disconnect_state_signals():
	owner.disconnect("started_dragging", _on_start_dragging)

func enter_state(_prev_state, _new_state):
	
	is_current_state = true
	
	owner.card_modulate_component.change_modulate_base()
	owner.card_sprite_change_component.change_to_card()
	
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)

func _on_start_dragging():
	if !owner.is_hovering_over_battlefield:
		_transition(state_machine.outside_battlefield)
		return
	if owner.valid_placement:
		_transition(state_machine.battlefield_valid)
		return
	else:
		_transition(state_machine.battlefield_valid)
		return
