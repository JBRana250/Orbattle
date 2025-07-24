extends Node

@export var player_battle_resources: PlayerBattleResources

@export var essence_rate: float
@export var essence: float
var snapped_essence: float

@export var essence_label: Label

func _ready():
	player_battle_resources.connect("essence_important_change", on_essence_important_change)

func on_essence_important_change():
	essence = snapped(player_battle_resources.essence, 0.1)
	essence_label.text = str(essence)

func _physics_process(delta: float) -> void:
	essence += essence_rate * delta
	snapped_essence = snapped(essence, 0.1)
	player_battle_resources.essence = snapped_essence
	essence_label.text = str(snapped_essence)
