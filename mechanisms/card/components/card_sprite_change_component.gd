extends Node

@export var current_drag_card_resource: CurrentDragCardResource
@export var card_sprites: Node2D

@export var card_sprite_scene: PackedScene
@export var globalpos_marker: PackedScene
@export var card_sprite_texture: Texture

@export var card_attributes: CardAttributes
@export var card_modulate_component: Node

var current_sprite: String = "CARD"

func _clear_card_sprites():
	for sprite in card_sprites.get_children():
		sprite.queue_free()

func change_to_battlefield_hover():
	if current_sprite == "BATTLEFIELD_HOVER":
		return
	current_sprite = "BATTLEFIELD_HOVER"
	
	_clear_card_sprites()
	current_drag_card_resource.card_battlefield_sprites_and_markers.clear()
	
	for i in range(card_attributes.card_number):
		var new_sprite = card_sprite_scene.instantiate()
		var pos = card_attributes.card_formation[i]
		new_sprite.texture = card_sprite_texture
		new_sprite.scale = Vector2(0.5, 0.5) * card_attributes.card_size
		new_sprite.position = pos
		
		var globalpos_marker_instance = globalpos_marker.instantiate()
		new_sprite.connect("tree_exiting", globalpos_marker_instance._self_destruct)
		new_sprite.global_pos_marker = globalpos_marker_instance
		globalpos_marker_instance.local_offset = pos
		get_tree().current_scene.add_child(globalpos_marker_instance)
		
		card_sprites.add_child(new_sprite)
		
		current_drag_card_resource.card_battlefield_sprites_and_markers[new_sprite] = globalpos_marker_instance

func change_to_card():
	if current_sprite == "CARD":
		return
	current_sprite = "CARD"
	_clear_card_sprites()
	
	var new_sprite = card_sprite_scene.instantiate()
	new_sprite.texture = card_sprite_texture
	new_sprite.scale = Vector2(0.5, 0.5)
	card_sprites.add_child(new_sprite)
	
