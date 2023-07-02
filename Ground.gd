extends Area2D



const SPEED := 300

signal spawn_ground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", self, "on_ground_trigger_area_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= SPEED * delta
	
func on_ground_trigger_area_entered(area: Area2D) -> void:
	emit_signal("spawn_ground")
	

#func on_ground_trigger_area_entered(area: Area2D) -> void:
#	# Directly call the function to bypass the signal
#	var ground_spawner = get_tree().current_scene.get_node("GroundSpawner")
#	ground_spawner.signal_test()
#	print("ground spawn signal sent to ground spawner")
