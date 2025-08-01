extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

func _connect_state_signals():
	owner.connect("entered_battlefield", _on_enter_battlefield)
	owner.connect("stopped_dragging", _on_stop_drag)

func _disconnect_state_signals():
	owner.disconnect("entered_battlefield", _on_enter_battlefield)
	owner.disconnect("stopped_dragging", _on_stop_drag)

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

func _on_enter_battlefield():
	if owner.valid_placement:
		_transition(state_machine.battlefield_valid)
		return
	else:
		_transition(state_machine.battlefield_invalid)
		return

func _on_stop_drag():
	MouseMaster.cursor_sprite_master.cursor_to_arrow.emit()
	_transition(state_machine.idle)
	return
	
