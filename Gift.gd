extends Area2D


const SPEED := 400

onready var visibility_enabler := $VisibilityEnabler2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visibility_enabler.connect("screen_exited", self, "on_visibility_enabler_screen_exited")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += SPEED * delta


func on_visibility_enabler_screen_exited() -> void:
	queue_free()


