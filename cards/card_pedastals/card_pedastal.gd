extends Node

@export var card_slot_sprite: Sprite2D  # the 'card' scene accesses this also

@export var pedastal_sprite: Sprite2D

var base_pedastal_texture = preload("res://textures/pedastals/base_pedastal.png")
var summon_pedastal_texture = preload("res://textures/pedastals/summon_pedastal.png")
var spell_pedastal_texture = preload("res://textures/pedastals/spell_pedastal.png")
var building_pedastal_texture = preload("res://textures/pedastals/building_pedastal.png")

@export var current_drag_card_resource: CurrentDragCardResource

@export var card_slot: Node2D  # the 'card' scene accesses this also

@export var card_cost_label: Label

@export var held_card: Node2D:
	set(value):
		held_card = value
		if value != null:
			held_card_attributes = held_card.card_attributes

@export var held_card_attributes: CardAttributes:
	set(value):
		held_card_attributes = value
		card_cost_label.text = str(value.card_cost)
		match held_card_attributes.card_type:
			"SUMMON":
				pedastal_sprite.texture = summon_pedastal_texture
			"SPELL":
				pedastal_sprite.texture = spell_pedastal_texture
			"BUILDING":
				pedastal_sprite.texture = building_pedastal_texture
			"NULL":
				pedastal_sprite.texture = base_pedastal_texture
				card_cost_label.text = ""
			_:
				print_debug("invalid card type")
		
@export var null_card_attributes: CardAttributes

func _ready():
	_hide_card_slot()
	current_drag_card_resource.connect("started_dragging", _display_card_slot)
	current_drag_card_resource.connect("stopped_dragging", _hide_card_slot)

func _display_card_slot():
	card_slot_sprite.visible = true

func _hide_card_slot():
	card_slot_sprite.visible = false

func card_entered_area(): 
	card_slot_sprite.self_modulate = Color(Color.AQUA)
	
func card_exited_area():
	card_slot_sprite.self_modulate = Color8(255, 255, 255, 100)

func card_placed_on_pedastal(card: Node2D):
	held_card = card
	
func card_left_pedastal():
	held_card = null
	held_card_attributes = null_card_attributes
	
func send_card_to_pedastal(pedastal):
	if !held_card:
		return
	held_card.card_relocation_component.update_home_pedastal(pedastal)
	held_card.card_relocation_component.goto_pedastal(pedastal)
