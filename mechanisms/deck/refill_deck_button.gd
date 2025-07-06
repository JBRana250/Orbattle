extends Node

@export var deck_resource: DeckResource
@export var graveyard_resource: GraveyardResource

@export var cards_manager: Node2D

func _on_mouse_entered() -> void:
	get_parent().scale = Vector2(1.05, 1.05)

func _on_mouse_exited() -> void:
	get_parent().scale = Vector2(1, 1)

func _on_pressed() -> void:
	_refill_deck()

func _refill_deck():
	if not deck_resource.cards_in_deck.is_empty():
		return
	
	if graveyard_resource.cards_in_grave.is_empty():
		return
	
	deck_resource.cards_in_deck = graveyard_resource.cards_in_grave.duplicate()
	
	graveyard_resource.cards_in_grave.clear()
	
	cards_manager.propagate_hand()
