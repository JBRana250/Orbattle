extends Node2D

@export var card_drag_component: Node2D

func goto_pedastal(pedastal: StaticBody2D):
	var tween = get_tree().create_tween()
	tween.tween_property(owner, "global_position", pedastal.card_slot.global_position, 0.2).set_ease(Tween.EASE_OUT)

func goto_droppable(droppable: Node2D):
	var tween = get_tree().create_tween()
	tween.tween_property(owner, "global_position",droppable.global_position, 0.2).set_ease(Tween.EASE_OUT)

func update_home_pedastal(pedastal: StaticBody2D):
	card_drag_component.home_pedastal = pedastal
	pedastal.card_placed_on_pedastal(owner)
