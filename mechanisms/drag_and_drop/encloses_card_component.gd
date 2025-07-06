extends Node2D

@export var current_drag_card_resource: CurrentDragCardResource
@export var rect_scale: Vector2

func calculate_enclosed():
	var card_battlefield_sprites_and_markers = current_drag_card_resource.card_battlefield_sprites_and_markers
	
	var enclosed: bool = true
	for sprite in card_battlefield_sprites_and_markers.keys():
		var globalpos_marker = card_battlefield_sprites_and_markers[sprite]
		if calculate_circle_fully_in_rect(sprite, globalpos_marker) == false:
			enclosed = false
	
	return enclosed

func calculate_circle_fully_in_rect(sprite: Sprite2D, globalpos_marker: Marker2D) -> bool:
	
	var sprite_pos = owner.global_position - globalpos_marker.global_position
	
	sprite_pos = Vector2(sprite_pos.x, sprite_pos.y) # account for godot y inversion
	
	var radius = (sprite.texture.get_width() * sprite.scale * 0.5).x  # 0.5 to adjust for inherent scale
	# rect scale
	
	#|x| <= (W/2 - r) condition 1 for enclosure
	if not(abs(sprite_pos.x) <= (rect_scale.x/2 - radius)):
		return false
	
	#y <= H-r cond 2
	if not(sprite_pos.y <= (rect_scale.y - radius)):
		return false
	
	#y >= r cond 3
	if not(sprite_pos.y >= radius):
		return false
	
	return true
