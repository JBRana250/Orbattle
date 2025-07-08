extends Node

func knockback_self(force: float, dir: Vector2):
	owner.linear_velocity += force * dir
