extends Node

@export var card_attributes: CardAttributes
@export var summon_sprite: Sprite2D

@export var sprite_texture: Texture

@export var summon_init_component: Node

func startup():
	summon_init_component.initialize_summon()
