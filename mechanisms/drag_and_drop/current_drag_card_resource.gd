extends Resource

class_name CurrentDragCardResource

# Is the player currently dragging something, and what are they dragging?
var is_dragging: bool = false
var current_drag_node: Node

signal started_dragging
signal stopped_dragging

# is the current placement valid?
var valid_placement: bool = false
signal valid_placement_set

# Is the card currently and validly in the battlefield? When it stops?
signal started_valid_battlefield_drop
signal stopped_valid_battlefield_drop

# The actual card battlefield sprites and their global pos markers
var card_battlefield_sprites_and_markers: Dictionary
