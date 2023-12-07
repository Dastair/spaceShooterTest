extends Node2D
@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate: Timer = $FireRate
@onready var scale_component = $ScaleComponent
@onready var animated_sprite_2d = $Anchor/AnimatedSprite2D
@onready var move_component = $MoveComponent
@onready var flame_animation = $Anchor/FlameAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	fire_rate.timeout.connect(fireLasers)
	pass # Replace with function body.

func fireLasers() -> void:
	spawner_component.spawn(left_cannon.global_position)
	spawner_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()

func _process(_delta) -> void:
	animate_the_ship()
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("left")
		flame_animation.play("left")
		flame_animation.offset.x = -1
		
	elif move_component.velocity.x > 0:
		flame_animation.play("right")
		animated_sprite_2d.play("right")
		flame_animation.offset.x = 0
	else:
		flame_animation.play("center")
		animated_sprite_2d.play("center")
		flame_animation.offset.x = 0
