extends Camera2D

@export var cam_speed: int
@export var camera_status_resource: CameraStatus

func _ready():
	camera_status_resource.camera_y_offset = self.position.y - 540
	set_process(false)

func _process(delta):
	if Input.is_action_pressed("pan_camera_up"):
		self.position.y -= cam_speed * delta
		camera_status_resource.camera_y_offset = self.position.y - 540
		camera_status_resource.camera_panned.emit()
	if Input.is_action_pressed("pan_camera_down"):
		self.position.y += cam_speed * delta
		camera_status_resource.camera_y_offset = self.position.y - 540
		camera_status_resource.camera_panned.emit()

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_released("pan_camera_up") or Input.is_action_just_released("pan_camera_up"):
		set_process(false)
		
	if Input.is_action_pressed("pan_camera_up"):
		set_process(true)
	if Input.is_action_pressed("pan_camera_down"):
		set_process(true)
