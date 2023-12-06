extends Node2D
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var scale_component = $ScaleComponent
@onready var flash_component = $FlashComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	scale_component.tween_scale()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	flash_component.flash()


