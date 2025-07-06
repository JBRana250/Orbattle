extends Node

class_name StateMachine

@export var current_state = null # DO NOT set directly, only use set_state
@export var prev_state = null
@export var initial_state: Node

func _ready():
	set_state(initial_state)

func set_state(new_state):
	prev_state = current_state
	current_state = new_state
	
	if prev_state != null:
		prev_state.exit_state(prev_state, new_state)
	if new_state != null:
		new_state.enter_state(prev_state, new_state)
