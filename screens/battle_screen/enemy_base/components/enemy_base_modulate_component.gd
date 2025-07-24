extends Node

@export var base_sprite: Sprite2D

@export var onhit_modulate: Color
@export var default_modulate: Color

@export var onhit_timer: Timer

func onhit_modulate_change():
	base_sprite.self_modulate = onhit_modulate
	onhit_timer.start()

func _on_on_hit_timer_timeout() -> void:
	base_sprite.self_modulate = default_modulate
