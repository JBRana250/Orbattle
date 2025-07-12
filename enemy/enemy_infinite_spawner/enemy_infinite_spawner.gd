extends Node2D


@export var spawn_initial_delay: Timer
@export var spawn_timer: Timer

@export var enemy_id: String:
	set(value):
		enemy_id = value
		enemy_data = StaticData.card_data[value]
var enemy_data: Dictionary

@export var x_offset: float

@export var enemy_scene: PackedScene

@onready var entities = get_tree().current_scene.entities
@export var enemy_base: StaticBody2D

func start(initial_delay: float, spawn_time: float, _x_offset: float, _enemy_id: String):
	
	spawn_timer.wait_time = spawn_time
	x_offset = _x_offset
	enemy_id = _enemy_id
	
	if initial_delay == 0:
		spawn_timer.start()
		return
	spawn_initial_delay.wait_time = initial_delay
	
	
	spawn_initial_delay.start()

func _on_spawn_initial_delay_timeout() -> void:
	spawn_timer.start()

func _on_spawn_timer_timeout() -> void:
	var enemy_instance = enemy_scene.instantiate()
	
	var enemy_pos = enemy_base.global_position + Vector2(x_offset, 0)
	enemy_instance.card_id = enemy_id
	enemy_instance.card_data = enemy_data
	
	entities.add_child(enemy_instance)
	enemy_instance.global_position = enemy_pos
	
	enemy_instance.startup()
