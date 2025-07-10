extends Node

@export var self_kb_component: Node
var damage: float

func _ready():
	damage = owner.card_attributes.damage

func _on_enemy_body_entered(body: Node) -> void:
	var state = PhysicsServer2D.body_get_direct_state(owner.get_rid())
	
	var normal = state.get_contact_local_normal(0)
	
	# make the body take damage
	body.health_component.hit(damage)
	
	# knocks itself back with (force, direction of force)
	self_kb_component.knockback_self(75, normal)
