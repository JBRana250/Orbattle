extends Node

func _input(event: InputEvent) -> void:
	if not Input.is_action_just_pressed("click"):
		return
		
	if owner.hover == true:
		owner.mouse_clicked.emit()
	else:
		owner.clicked_elsewhere.emit()
