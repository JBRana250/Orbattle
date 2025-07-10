extends Resource

class_name StageSpawnData

@export var finite_spawns: Array[EnemySpawnData] 
# Each entry in the array is a Resource containing [time of spawn, spawn x-displacement from enemy base center, enemy card attribute resource]
# Each entry is only spawned a single time, at the specific time specified in the entry.

@export var infinite_spawns: Dictionary[float, EnemySpawnData] 
# Each entry in the array is a float representing time offset of inf spawn start and a
# Resource containing [time delay between spawns, spawn x-displacement from enemy base center, enemy card attribute resource]

# These continue spawning until the player beats the level.
