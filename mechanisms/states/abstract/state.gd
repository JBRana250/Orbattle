extends Node

class_name State

@export var is_current_state: bool = false

@onready var state_machine: Node = get_parent()

func _connect_state_signals():
	pass

func _disconnect_state_signals():
	pass

func enter_state(_prev_state, _new_state):
	is_current_state = true
	_connect_state_signals()

func exit_state(_prev_state, _new_state):
	is_current_state = false
	_disconnect_state_signals()

func _transition(state):
	state_machine.set_state(state)
