extends Node

var card_id: String
var card_data: Dictionary
@export var summon_sprite: Sprite2D

@export var sprite_texture: Texture

@export var enemy_init_component: Node
@export var collide_with_body_component: Node

@export var health_component: Node

func startup():
	self.mass = card_data.mass
	self.sprite_texture = StaticData.card_id_to_image(card_id)
	enemy_init_component.initialize_summon()
