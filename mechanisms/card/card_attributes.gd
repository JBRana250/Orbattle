extends Resource

class_name CardAttributes

@export var card_type: String # Either SUMMON, SPELL or BUILDING
@export var card_cost: int

@export var card_sprite_texture: Texture

# Battle Attributes
@export_group("Battle Attributes")
@export var card_size: float  # (0.5, 0.5) is default size. This float will be multiplied with this size vector to obtain the card's size.
@export var card_number: int # This represents the number of sprites that the card has. Any card type can have any amount, although most have only 1.
@export var card_formation: Array[Vector2] # This is the formation that the card's sprites are in, representing the local position of the card's sprites. By default, this is [(0,0)] with 1 sprite.

@export_subgroup("Movement Stats")
@export var walk_speed: float
@export var walk_accel: float
@export var mass: float

@export_subgroup("Battle Stats")
@export var damage: float
@export var health: float
