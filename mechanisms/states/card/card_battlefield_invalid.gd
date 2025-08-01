extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

func _connect_state_signals():
	owner.connect("left_battlefield", _on_leave_battlefield)
	owner.connect("stopped_dragging", _on_stop_drag)
	owner.connect("become_valid", _on_become_valid)

func _disconnect_state_signals():
	owner.disconnect("left_battlefield", _on_leave_battlefield)
	owner.disconnect("stopped_dragging", _on_stop_drag)
	owner.disconnect("become_valid", _on_become_valid)

func enter_state(_prev_state, _new_state):
	is_current_state = true
	
	owner.card_modulate_component.change_modulate_invalid()
	owner.card_sprite_change_component.change_to_battlefield_hover()
	
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)

# This function is called eight times per second
func _physics_process(_delta):
	if !owner.is_hovering_over_battlefield:
		_transition(state_machine.outside_battlefield)
		return
	if owner.valid_placement:
		_transition(state_machine.battlefield_valid)
		return

func _on_leave_battlefield():
	_transition(state_machine.outside_battlefield)

func _on_stop_drag():
	MouseMaster.cursor_sprite_master.cursor_to_arrow.emit()
	_transition(state_machine.idle)

func _on_become_valid():
	_transition(state_machine.battlefield_valid)
