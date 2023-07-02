extends Node2D

onready var spawn_points := $SpawnPoints
onready var timer := $Timer

var obstacle := preload("res://Ground.tscn")

func _ready() -> void:
	randomize()
	timer.connect("timeout", self, "on_spawn_timer_timeout")
	spawn_obstacle()
	
func _process(delta: float) -> void:
	pass

func get_spawn_position() -> Vector2:
	var points = spawn_points.get_children()
	points.shuffle()
	return points[0].global_position

func spawn_obstacle():
	var spawn_position: Vector2 = get_spawn_position()
	var main = get_tree().current_scene
	var ground = obstacle.instance()
	
	
	# Connect the signal
	ground.connect("spawn_ground", self, "signal_test")
	
	# Adding the ground to the scene
	add_child(ground)
	ground.global_position = spawn_position

func on_spawn_timer_timeout() -> void:
	spawn_obstacle()

func signal_test() -> void:
	spawn_obstacle()


	

	


