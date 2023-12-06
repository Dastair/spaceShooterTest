extends Node2D
@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate: Timer = $FireRate
@onready var scale_component = $ScaleComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	fire_rate.timeout.connect(fireLasers)
	pass # Replace with function body.

func fireLasers() -> void:
	spawner_component.spawn(left_cannon.global_position)
	spawner_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()
