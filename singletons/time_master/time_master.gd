extends Node

@export var battle_time_elapsed: float # how many seconds elapsed
@export var battle_timer: Timer

func start_battle_timer():
	battle_timer.start()

func stop_battle_timer():
	battle_timer.stop()

func _on_battle_timer_timeout() -> void:
	battle_time_elapsed += 0.1
