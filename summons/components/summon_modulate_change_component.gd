extends Node

@export var default_modulate: Color
@export var onhit_modulate: Color

@export var onhit_timer: Timer

func onhit_modulate_change():
	owner.modulate = onhit_modulate
	onhit_timer.start()

func _on_on_hit_timer_timeout() -> void:
	owner.modulate = default_modulate
