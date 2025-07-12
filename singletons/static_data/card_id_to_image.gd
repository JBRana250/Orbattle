extends Node

@onready var card_id_to_image_dict: Dictionary = {  # all card textures are loaded when game starts
	"goblin_peon": preload("res://textures/cards/goblin_peon.png"),
	"peasant": preload("res://textures/cards/peasant.png")
}
