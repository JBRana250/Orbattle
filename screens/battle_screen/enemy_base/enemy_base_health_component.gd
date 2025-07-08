extends Node

@export var starting_health: float
@export var health: float

func _ready():
	health = starting_health

func hit(amount: float):
	health -= amount
	if health <= 0:
		print_debug("Victory!")
		owner.queue_free()
