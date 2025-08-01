extends Node

# all card textures are loaded here when game starts

@onready var card_id_to_image_dict: Dictionary = {  
	"goblin_peon": preload("res://textures/cards/goblin_peon.png"),
	"peasant": preload("res://textures/cards/peasant.png")
}
