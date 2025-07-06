extends Node

@export var card_battlefield_modulate: Color
@export var card_battlefield_invalid_modulate: Color

func change_modulate_base():
	owner.modulate = Color.WHITE

func change_modulate_valid():
	owner.modulate = card_battlefield_modulate

func change_modulate_invalid():
	owner.modulate = card_battlefield_invalid_modulate
