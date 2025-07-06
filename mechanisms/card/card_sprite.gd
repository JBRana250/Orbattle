extends Node

@export var global_pos_marker: Node2D
@export var camera_status_resource: CameraStatus

func _physics_process(_delta: float) -> void:
	if global_pos_marker == null:
		return
	global_pos_marker.position = Vector2(self.global_position.x, self.global_position.y + camera_status_resource.camera_y_offset)
