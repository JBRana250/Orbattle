extends Node

@export var entities: Node2D

func _ready():
	SceneTreeDetails.current_root = self
