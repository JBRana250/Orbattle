extends Node

signal mouse_entered
signal mouse_exited
signal mouse_clicked
signal clicked_elsewhere

@export var region_id: String
var region_data:
	set(value):
		region_data = value
		if value == null:
			return
		
		_set_region_name(region_data["region_name"])

@export var stage_select_ui: Control
@export var camera: Camera2D
@export var region_name_label: Label

@export var hover: bool = false:
	set(value):
		if hover == value:
			return
		hover = value
		if hover == true:
			mouse_entered.emit()
		else:
			mouse_exited.emit()

func _set_region_name(region_name: String):
	region_name_label.text = region_name

func _ready():
	if region_id in StaticData.region_data:
		region_data = StaticData.region_data[region_id]
