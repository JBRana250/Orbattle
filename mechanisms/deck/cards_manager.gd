extends Node2D

@export_group("Card Areas")
@export var deck_resource: DeckResource
@export var graveyard_resource: GraveyardResource
@export var hand_resource: HandResource

@export_group("Premade Cards")
@export var null_card_resource: CardResource

@export_group("Scene Nodes")
@export var pedastal_a: StaticBody2D
@export var pedastal_b: StaticBody2D
@export var pedastal_c: StaticBody2D
@export var pedastal_d: StaticBody2D

@export var deck_altar_marker: Marker2D
@export var ui_canvas_layer: CanvasLayer

@export var card_preview: Sprite2D


@export_group("Packed Scenes")
@export var card_scene: PackedScene

func _ready():
	deck_resource.card_got_used.connect(_on_card_got_used)
	_init_hand()
	call_deferred("propagate_hand")

func _on_card_got_used():
	
	propagate_hand()
	
	if !deck_resource.cards_in_deck.is_empty():
		_preview_next_card(deck_resource.cards_in_deck[0])

func _append_card_to_slot(pedastal: StaticBody2D):
	
	var top_card = deck_resource.cards_in_deck.pop_at(0)
	hand_resource.cards_in_hand[pedastal] = top_card
	
	card_preview.visible = false
	var card_instance = card_scene.instantiate()
	card_instance.card_attributes = top_card.card_attributes
	card_instance.card_resource = top_card
	card_instance.start_init()
	card_instance.global_position = deck_altar_marker.global_position
	
	card_instance.home_pedastal = pedastal
	card_instance.card_drag_component.home_pedastal = pedastal
	ui_canvas_layer.call_deferred("add_child", card_instance)
	
	var tween = get_tree().create_tween()
	tween.tween_property(card_instance, "global_position", pedastal.card_slot.global_position, 0.2).set_ease(Tween.EASE_OUT)
	pedastal.card_placed_on_pedastal(card_instance)

func _preview_next_card(card: CardResource):
	card_preview.texture = card.card_attributes.card_sprite_texture
	card_preview.visible = true

func _init_hand():
	hand_resource.cards_in_hand[pedastal_a] = null_card_resource
	hand_resource.cards_in_hand[pedastal_b] = null_card_resource
	
	hand_resource.cards_in_hand[pedastal_c] = null_card_resource
	hand_resource.cards_in_hand[pedastal_d] = null_card_resource

func propagate_hand():
	
	if hand_resource.cards_in_hand[pedastal_a] == null_card_resource:
		if deck_resource.cards_in_deck.is_empty():
			return
		
		_append_card_to_slot(pedastal_a)

	if hand_resource.cards_in_hand[pedastal_b] == null_card_resource:
		if deck_resource.cards_in_deck.is_empty():
			return
			
		_append_card_to_slot(pedastal_b)

	if hand_resource.cards_in_hand[pedastal_c] == null_card_resource:
		if deck_resource.cards_in_deck.is_empty():
			return
			
		_append_card_to_slot(pedastal_c)
		
	if hand_resource.cards_in_hand[pedastal_d] == null_card_resource:
		if deck_resource.cards_in_deck.is_empty():
			return
			
		_append_card_to_slot(pedastal_d)
		
	# At this point, all card slots are full and deck still has cards.
	# Show the next card
	if deck_resource.cards_in_deck.is_empty():
		return
	_preview_next_card(deck_resource.cards_in_deck[0])
