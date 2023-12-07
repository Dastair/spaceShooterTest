extends Node2D

@export var GreenEnemy: PackedScene

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var green_spawn_timer = $GreenSpawnTimer as Timer
@onready var spawner_component = $SpawnerComponent as SpawnerComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	green_spawn_timer.timeout.connect(spawn.bind(GreenEnemy, green_spawn_timer))

func spawn(enemy_scene: PackedScene, timer: Timer):
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	timer.start()
	
	
