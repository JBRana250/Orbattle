extends Node

@export var card_sprites: Node2D

@export var current_drag_card_resource: CurrentDragCardResource
@export var card_modulate_component:Node

func _ready():
	current_drag_card_resource.connect("valid_placement_set", _on_valid_placement_set)

func _on_valid_placement_set():
	owner.valid_placement = current_drag_card_resource.valid_placement
