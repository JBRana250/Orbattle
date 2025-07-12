extends Node

@export var modulate_change_component: Node
@export var starting_health: float
@export var health: float

func init_health():
	starting_health = owner.card_data.health
	health = starting_health

func hit(amount: float):
	health -= amount
	if health <= 0:
		owner.queue_free()
	
	modulate_change_component.onhit_modulate_change()
