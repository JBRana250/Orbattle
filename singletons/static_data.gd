extends Node

var card_data
var stage_data

func _ready():
	stage_data = _import_json_file("res://data/Orbattle Stage Database.json")
	var test_data = stage_data["GP-A1"]["stage_infinite_spawn_array"][0]
	print_debug(test_data)

func _import_json_file(path: String) -> Dictionary:
	var json_text = FileAccess.get_file_as_string(path)
	var json_dict = JSON.parse_string(json_text)
	return json_dict
