extends Node

@export var entities: Node2D

func _ready():
	TimeMaster.start_battle_timer()
