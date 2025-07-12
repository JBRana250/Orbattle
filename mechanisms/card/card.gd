extends Node

@export_group("External Refs")
@export var home_pedastal: StaticBody2D

@export_group("Scene Nodes")
@export var card_sprite_change_component: Node
@export var card_modulate_component: Node
@export var card_init_component: Node
@export var card_drag_component: Node2D
@export var card_relocation_component: Node2D

@export var card_sprite: Sprite2D
@export var card_sprites: Node2D
@export var state_machine: Node

@export_group("Card Conditions")
@export var is_hovering_over_battlefield: bool = false:
	set(value):
		if value == true and is_hovering_over_battlefield == false:  # only do something when value changes
			entered_battlefield.emit()
			is_hovering_over_battlefield = value
		elif value == false and is_hovering_over_battlefield == true:
			left_battlefield.emit()
			is_hovering_over_battlefield = value
@export var currently_being_dragged: bool = false:
	set(value):
		if value == true and currently_being_dragged == false:  # only do something when value changes
			started_dragging.emit()
			currently_being_dragged = value
		elif value == false and currently_being_dragged == true:
			stopped_dragging.emit()
			currently_being_dragged = value
@export var valid_placement: bool = false:
	set(value):
		if value == true and valid_placement == false:  # only do something when value changes
			become_valid.emit()
			valid_placement = value
		elif value == false and valid_placement == true:
			become_invalid.emit()
			valid_placement = value

@export_group("Card Specifics")
@export var card_resource: CardResource:
	set(value):
		card_resource = value
		card_data = StaticData.card_data[value.card_id]
var card_data: Dictionary

@export_group("")
@export var current_drag_card_resource: CurrentDragCardResource

signal started_dragging
signal stopped_dragging
signal entered_battlefield
signal left_battlefield
signal become_valid
signal become_invalid

func start_init():
	card_init_component.init_card()
