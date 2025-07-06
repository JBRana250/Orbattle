extends Node

@export var local_offset: Vector2

func _self_destruct():
	self.queue_free()
