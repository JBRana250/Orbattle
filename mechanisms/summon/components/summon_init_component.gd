extends Node

@export var states: Node

@export var summon_sprite: Sprite2D
@export var col_shape: CollisionShape2D

func initialize_summon():
	owner.summon_sprite.texture = owner.sprite_texture
	var scale = Vector2(owner.card_attributes.card_size, owner.card_attributes.card_size)
	summon_sprite.scale *= scale
	col_shape.scale *= scale
	states.init_states()
