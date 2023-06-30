extends Node2D

onready var spawn_points := $SpawnPoints
onready var spawn_timer := $Timer

var obstacle := preload("res://Plane.tscn")

func _ready() -> void:
	randomize()
	spawn_timer.connect("timeout", self, "on_spawn_timer_timeout")
	spawn_timer.start(2)


func _process(delta: float) -> void:
	pass
	
func get_spawn_position()  -> Vector2:
	var points := spawn_points.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_obstacle():
	var spawn_position : Vector2 = get_spawn_position()
	var main := get_tree().current_scene
	var plane := obstacle.instance()
	main.add_child(plane)
	plane.global_position = spawn_position
	

	
func on_spawn_timer_timeout():
	spawn_obstacle()
