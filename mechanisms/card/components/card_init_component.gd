extends Node

func init_card():
	var texture = owner.card_attributes.card_sprite_texture
	
	owner.card_sprite.texture = texture
	
	owner.card_sprite_change_component.card_sprite_texture = texture
	owner.card_sprite_change_component.card_attributes = owner.card_attributes
	
	owner.state_machine.init_states()
