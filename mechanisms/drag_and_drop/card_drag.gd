extends Node2D

@export var current_drag_card_resource: CurrentDragCardResource
@export var home_pedastal: StaticBody2D:  # this is the pedastal that the card starts on
	set(value):
		if value == null:
			return
		home_pedastal = value
		owner.home_pedastal = value

@export var card_relocation_component: Node2D

var draggable: bool = false:
	set(value):
		if value == true:
			set_process(true)
			draggable = true
		if value == false and is_currently_being_dragged == false:
			set_process(false)
			draggable = false

@export var hand_resource: HandResource
@export var null_card_resource: CardResource

var is_currently_being_dragged: bool = false:
	set(value):
		is_currently_being_dragged = value
		owner.currently_being_dragged = value

var is_inside_droppable: bool = false
var droppable_area_ref: Node

var dropped_on_type: String # What kind of game object was the card dropped on?

func _ready():
	home_pedastal = owner.home_pedastal
	set_process(false)

func _process(_delta):
	if Input.is_action_just_pressed("click"):
		
		current_drag_card_resource.is_dragging = true
		is_currently_being_dragged = true
		current_drag_card_resource.current_drag_node = owner
		
		current_drag_card_resource.started_dragging.emit()
		
	if Input.is_action_pressed("click"):
		
		owner.global_position = get_global_mouse_position()
		
	elif Input.is_action_just_released("click"):
		
		current_drag_card_resource.is_dragging = false
		is_currently_being_dragged = false
		current_drag_card_resource.current_drag_node = null
		
		owner.is_hovering_over_battlefield = false
		
		current_drag_card_resource.stopped_dragging.emit()
		
		
		
		if is_inside_droppable:
			
			if dropped_on_type == "PEDASTAL":
				
				if not (droppable_area_ref.held_card == null): # card is already there; switch places
					_switch_pedastals()
					return
				
				if home_pedastal:
					home_pedastal.card_left_pedastal()
					hand_resource.cards_in_hand[home_pedastal] = null_card_resource
					
				_drop_on_pedastal()
				
			else:
				
				_drop_on_droppable()
				
		else:
			
			_return_home()

func _switch_pedastals():
	if !home_pedastal:
		return
	droppable_area_ref.send_card_to_pedastal(home_pedastal)
	_drop_on_pedastal()

func _drop_on_pedastal():
	
	home_pedastal = droppable_area_ref
	home_pedastal.card_placed_on_pedastal(owner) # call _card_entered_pedastal() on new home pedastal
	hand_resource.cards_in_hand[home_pedastal] = owner.card_resource
	
	card_relocation_component.goto_pedastal(home_pedastal)

func _drop_on_droppable():
	card_relocation_component.goto_droppable(droppable_area_ref)

func _return_home():
	if !home_pedastal:
		return
	card_relocation_component.goto_pedastal(home_pedastal)

func _on_area_2d_mouse_entered() -> void:
	if not current_drag_card_resource.is_dragging:
		draggable = true
		owner.scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
	if not current_drag_card_resource.is_dragging:
		draggable = false
		owner.scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: StaticBody2D) -> void:
	if body.is_in_group("droppable"):
		is_inside_droppable = true
		if body.is_in_group("card_pedastal"):
			body.card_entered_area()
			droppable_area_ref = body
			dropped_on_type = "PEDASTAL"
		else:
			dropped_on_type = "NULL"

func _on_area_2d_body_exited(body: StaticBody2D) -> void:
	if not body.is_in_group("droppable"):
		return
	
	if not body.is_in_group("card_pedastal"):
		return
		
	body.card_exited_area()
	
	if body == droppable_area_ref:
		droppable_area_ref = null
		is_inside_droppable = false
