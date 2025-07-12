extends Node

func init_card():
	var texture = StaticData.card_id_to_image(owner.card_resource.card_id)
	
	owner.card_sprite.texture = texture
	
	owner.card_sprite_change_component.card_sprite_texture = texture
	owner.card_sprite_change_component.card_resource = owner.card_resource
	
	owner.state_machine.init_states()
