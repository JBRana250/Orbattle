extends Node2D

@export var current_drag_card_resource: CurrentDragCardResource

@export var graveyard_resource: GraveyardResource
@export var hand_resource: HandResource
@export var deck_resource: DeckResource

@export var summon_scene: PackedScene

@export var null_card_resource: CardResource

func use_card():
	var card_attributes = owner.card_attributes
	match card_attributes.card_type:
		"SUMMON":
			_create_all_summons()
		"SPELL":
			pass
		"BUILDING":
			pass
		_:
			print_debug("unknown card type")
	owner.home_pedastal.card_left_pedastal()
	
	graveyard_resource.cards_in_grave.append(owner.card_resource)
	hand_resource.cards_in_hand[owner.home_pedastal] = null_card_resource
	deck_resource.card_got_used.emit()
	
	owner.queue_free()

func _create_all_summons():
	var card_attributes = owner.card_attributes
	var card_num = card_attributes.card_number
	
	for num in range(card_num):
		_create_summon(num)

func _create_summon(iterator_num: int):
	
	var summon_instance = summon_scene.instantiate()
	var current_marker = current_drag_card_resource.card_battlefield_sprites_and_markers.values()[iterator_num]
	
	var local_pos = get_tree().current_scene.entities.global_position - current_marker.global_position
	local_pos = Vector2(-local_pos.x, current_marker.local_offset.y + 50)
	
	summon_instance.position = local_pos
	summon_instance.card_attributes = owner.card_attributes
	summon_instance.sprite_texture = owner.card_attributes.card_sprite_texture
	
	get_tree().current_scene.entities.add_child(summon_instance)
	summon_instance.startup()
