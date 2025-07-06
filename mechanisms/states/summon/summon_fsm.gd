extends StateMachine

#@export var current_state = null # DO NOT set directly, only use set_state
#@export var prev_state = null
#@export var initial_state: Node

@export var idle: Node
@export var walking: Node
@export var attacking: Node
@export var dying: Node

func _ready():
	pass

func init_walking():
	walking.walk_speed = owner.card_attributes.walk_speed
	walking.acceleration = owner.card_attributes.walk_accel

func init_states():
	init_walking()
	set_state(initial_state)

func set_state(new_state):
	prev_state = current_state
	current_state = new_state
	
	if prev_state != null:
		prev_state.exit_state(prev_state, new_state)
	if new_state != null:
		new_state.enter_state(prev_state, new_state)
