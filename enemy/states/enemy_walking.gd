extends State

#@export var is_current_state: bool = false

#@onready var state_machine: Node = get_parent()

@export var walk_speed: float
@export var acceleration: float

func _connect_state_signals():
	pass

func _disconnect_state_signals():
	pass

func _ready():
	set_physics_process(false)

func enter_state(_prev_state, _new_state):
	is_current_state = true
	_connect_state_signals()
	set_physics_process(true)

func exit_state(_prev_state, _new_state):
	is_current_state = false
	_disconnect_state_signals()
	set_physics_process(false)

func _transition(state):
	state_machine.set_state(state)
	
func _physics_process(_delta: float) -> void:
	if owner.linear_velocity.y < walk_speed:
		owner.linear_velocity.y += acceleration
	else:
		owner.linear_velocity.y = walk_speed
