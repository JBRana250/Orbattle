extends Node2D

@export var card_path_scene: PackedScene
@export var current_drag_card_resource: CurrentDragCardResource

@export var card_paths: Node2D
var card_paths_array: Array[Node2D]

func _ready():
	set_process(false)
	current_drag_card_resource.connect("started_valid_battlefield_drop", _on_started_valid_battlefield_drop)
	current_drag_card_resource.connect("stopped_valid_battlefield_drop", _on_stopped_valid_battlefield_drop)

func _on_started_valid_battlefield_drop():
	_clear_card_paths()
	_generate_card_paths()
	set_process(true)

func _on_stopped_valid_battlefield_drop():
	set_process(false)
	_clear_card_paths()

func _generate_card_path(start_point: Vector2, end_point: Vector2):
	
	var card_path_instance = card_path_scene.instantiate()
	card_path_instance.position = start_point
	card_path_instance.end_pos = end_point
	
	card_paths_array.append(card_path_instance)
	card_paths.add_child(card_path_instance)

func _generate_card_paths():
	
	for marker in current_drag_card_resource.card_battlefield_sprites_and_markers.values():
		var local_card_sprite_pos = owner.global_position - marker.global_position
		var start_point = Vector2(-local_card_sprite_pos.x, 0) # the position of card_path
		var end_point = Vector2(0, local_card_sprite_pos.y) # what will be passed into card_path as the end_pos variable
		_generate_card_path(start_point, end_point)

func _process(_delta):
	var iterator: int = 0
	
	for marker in current_drag_card_resource.card_battlefield_sprites_and_markers.values():
		var local_card_sprite_pos = owner.global_position - marker.global_position
		var start_point = Vector2(-local_card_sprite_pos.x, 0) # the position of card_path
		var end_point = Vector2(0, local_card_sprite_pos.y) # what will be passed into card_path as the end_pos variable
		
		if card_paths_array[iterator] == null:
			print_debug("invalid iterator")
			return
		
		var current_path = card_paths_array[iterator]
		current_path.position = start_point
		current_path.end_pos = end_point
		current_path.make_path()
		
		iterator += 1
	
	


func _clear_card_paths():
	for card_path in card_paths.get_children():
		card_path.queue_free()
	card_paths_array.clear()
