extends Node

@export var states: Node
@export var health_component: Node

@export var summon_sprite: Sprite2D
@export var col_shape: CollisionShape2D

func initialize_summon():
	owner.summon_sprite.texture = owner.sprite_texture
	var scale = Vector2(owner.card_data.card_size, owner.card_data.card_size)
	summon_sprite.scale *= scale
	col_shape.scale *= scale
	
	health_component.init_health()
	states.init_states()
