extends Node

var card_data
var stage_data
var region_data

@export var card_id_to_image_node: Node

func _ready():
	region_data = _import_json_file("res://data/Orbattle Region Database.json")
	stage_data = _import_json_file("res://data/Orbattle Stage Database.json")
	card_data = _import_json_file("res://data/Orbattle Card Database.json")

func _import_json_file(path: String) -> Dictionary:
	var json_text = FileAccess.get_file_as_string(path)
	var json_dict = JSON.parse_string(json_text)
	return json_dict

func card_id_to_image(card_id: String) -> Texture:
	return card_id_to_image_node.card_id_to_image_dict[card_id]
