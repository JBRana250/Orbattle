extends Node

@export var card_resource: CardResource:
	set(value):
		card_resource = value
		card_data = StaticData.card_data[value.card_id]
var card_data: Dictionary

@export var summon_sprite: Sprite2D

@export var sprite_texture: Texture

@export var summon_init_component: Node
@export var collide_with_body_component: Node

@export var health_component: Node

func startup():
	self.mass = StaticData.card_data[card_resource.card_id]["mass"]
	summon_init_component.initialize_summon()
