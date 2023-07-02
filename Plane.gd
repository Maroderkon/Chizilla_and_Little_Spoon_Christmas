extends Area2D


const SPEED := 300

onready var visibility_enabler := $VisibilityEnabler2D

var speed := rand_range(250.0, 500.0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visibility_enabler.connect("screen_exited", self, "on_visibility_enabler_screen_exited")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= speed * delta
	
func on_visibility_enabler_screen_exited() -> void:
	print("Bird about to queue free")
	queue_free()
