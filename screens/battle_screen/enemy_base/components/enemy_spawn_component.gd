extends Node2D

@export var spawners_node: Node2D

@export var stage_data_resource: StageDataResource
@export var enemy_finite_spawner: PackedScene
@export var enemy_infinite_spawner: PackedScene

func _ready():
	_instance_finite_spawners()
	_instance_infinite_spawners()

func _instance_finite_spawners():
	pass

func _instance_infinite_spawners():
	
	var spawners = StaticData.stage_data[stage_data_resource.stage_id]["stage_infinite_spawn_array"]
	
	for spawner in spawners:
		var spawn_delay = spawner[0]
		var spawn_time = spawner[1]
		var x_offset = spawner[2]
		var enemy_id = spawner[3]
		
		var infinite_spawner_instance = enemy_infinite_spawner.instantiate()
		
		infinite_spawner_instance.enemy_base = owner
		
		# initial_delay: float, spawn_time: float, _x_offset: float, _enemy_resource: CardResource
		spawners_node.add_child(infinite_spawner_instance)
		infinite_spawner_instance.start(spawn_delay, spawn_time, x_offset, enemy_id)
		
