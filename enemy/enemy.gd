extends Node

@export var card_attributes: CardAttributes
@export var summon_sprite: Sprite2D

@export var sprite_texture: Texture

@export var enemy_init_component: Node
@export var collide_with_body_component: Node

func startup():
	self.mass = card_attributes.mass
	enemy_init_component.initialize_summon()
