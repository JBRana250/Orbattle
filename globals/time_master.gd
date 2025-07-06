extends Node

signal EightCPSTimeout

func _on_8cps_process_timeout() -> void:
	EightCPSTimeout.emit()
