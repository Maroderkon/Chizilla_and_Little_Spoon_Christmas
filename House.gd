extends Area2D



const SPEED := 300

signal score_up

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", self, "on_gift_area_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= SPEED * delta


func on_gift_area_entered(area: Area2D):
	area.queue_free()
	emit_signal("score_up")
	
