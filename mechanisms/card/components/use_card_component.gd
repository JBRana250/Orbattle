extends Node2D

@export var current_drag_card_resource: CurrentDragCardResource

@export var player_battle_resources: PlayerBattleResources

@export var graveyard_resource: GraveyardResource
@export var hand_resource: HandResource
@export var deck_resource: DeckResource

@export var summon_scene: PackedScene

@export var null_card_resource: CardResource

func use_card():
	
	var current_essence = player_battle_resources.essence
	var card_cost = owner.card_data.card_cost
	
	if current_essence < card_cost:
		return
	
	player_battle_resources.essence -= card_cost
	player_battle_resources.essence_important_change.emit()
	
	var card_data = owner.card_data
	match card_data.card_type:
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
	var card_data = owner.card_data
	var card_num = card_data.card_number
	var texture = StaticData.card_id_to_image(owner.card_resource.card_id)
	
	for num in range(card_num):
		_create_summon(num, texture)

func _create_summon(iterator_num: int, texture: Texture):
	
	var summon_instance = summon_scene.instantiate()
	var current_marker = current_drag_card_resource.card_battlefield_sprites_and_markers.values()[iterator_num]
	
	var local_pos = get_tree().current_scene.entities.global_position - current_marker.global_position
	local_pos = Vector2(-local_pos.x, current_marker.local_offset.y + 50)
	
	summon_instance.position = local_pos
	summon_instance.card_resource = owner.card_resource
	summon_instance.sprite_texture = texture
	
	get_tree().current_scene.entities.add_child(summon_instance)
	summon_instance.startup()
