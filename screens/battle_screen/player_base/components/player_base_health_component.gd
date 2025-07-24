extends Node

@export var player_base_modulate_component: Node

@export var starting_health: float
@export var health: float

func _ready():
	health = starting_health

func hit(amount: float):
	health -= amount
	
	player_base_modulate_component.onhit_modulate_change()
	
	if health <= 0:
		print_debug("Victory!")
		owner.queue_free()
