extends State

#@export var is_current_state: bool = false
#@onready var state_machine: Node = get_parent()

@export var use_card_component: Node

@export var current_drag_card_resource: CurrentDragCardResource

func _connect_state_signals():
	owner.connect("left_battlefield", _on_leave_battlefield)
	owner.connect("stopped_dragging", _on_stop_drag)
	owner.connect("become_invalid", _on_become_invalid)

func _disconnect_state_signals():
	owner.disconnect("left_battlefield", _on_leave_battlefield)
	owner.disconnect("stopped_dragging", _on_stop_drag)
	owner.disconnect("become_invalid", _on_become_invalid)

func enter_state(_prev_state, _new_state):
	is_current_state = true
	
	owner.card_modulate_component.change_modulate_valid()
	owner.card_sprite_change_component.change_to_battlefield_hover()
	
	current_drag_card_resource.started_valid_battlefield_drop.emit()
	
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	
	current_drag_card_resource.stopped_valid_battlefield_drop.emit()
	
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)

func _on_leave_battlefield():
	_transition(state_machine.outside_battlefield)

func _on_stop_drag():
	use_card_component.use_card()
	if is_instance_valid(owner):
		_transition(state_machine.idle)

func _on_become_invalid():
	_transition(state_machine.battlefield_invalid)
