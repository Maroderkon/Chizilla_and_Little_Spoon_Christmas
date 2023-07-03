extends Area2D

onready var visibility_enabler := $VisibilityEnabler2D
onready var gift_collision_sound := $GiftCollisionSound

const SPEED := 300

signal score_up


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", self, "on_gift_area_entered")
	visibility_enabler.connect("screen_exited", self, "on_visibility_enabler_screen_exited")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= SPEED * delta


func on_gift_area_entered(area: Area2D):
	area.queue_free()
	emit_signal("score_up")
	gift_collision_sound.play()
		
	
	
func on_visibility_enabler_screen_exited() -> void:
	queue_free()
