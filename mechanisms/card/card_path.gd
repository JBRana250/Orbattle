extends Node

@export var end_pos: Vector2  # local start_pos will always be 0,0
@export var line_angle: float
@export var line_length: float

@export var single_arrow_rect_ysize: float
@export var single_arrow_rect_xsize: float
@export var arrow_num: float

@export var card_path_arrow_sprite: Sprite2D

func make_path():
	line_length = end_pos.length()
	arrow_num = (line_length / single_arrow_rect_ysize) / self.scale.y
	
	card_path_arrow_sprite.region_rect = Rect2(0, 0, single_arrow_rect_xsize, arrow_num * single_arrow_rect_ysize)
	card_path_arrow_sprite.position.y = -((arrow_num * single_arrow_rect_ysize) / 2)
	
	# calculations for angle of line, not necessary yet
	
	# var normal_coordinate_end_pos = Vector2(end_pos.x, -end_pos.y) #since in godot positive y is negative.
	# var x_change = normal_coordinate_end_pos.x - 0
	# var y_change = normal_coordinate_end_pos.y - 0
	

	# line_length = end_pos.length()
	# line_angle = acos(Vector2(0,1).dot(normal_coordinate_end_pos) / normal_coordinate_end_pos.length())  # This is the smallest unsigned angle between the end_pos and the positive y axis
	
	#if y_change < 0:
		#line_angle += PI/2
	#if x_change < 0:
		#line_angle = -line_angle
	#
	#self.rotation = line_angle
	
	

func _ready():
	make_path()
