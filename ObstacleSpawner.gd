extends Node2D

onready var spawn_points := $SpawnPoints
onready var spawn_timer := $SpawnTimer
onready var difficutly_timer := $DifficultyTimer

var obstacle := preload("res://Plane.tscn")
var difficulty_spawn_rate := 2.0 #2.0

func _ready() -> void:
	randomize()
	spawn_timer.connect("timeout", self, "on_spawn_timer_timeout")
#	spawn_timer.start(difficulty_spawn_rate)
	difficutly_timer.connect("timeout", self, "on_difficulty_timer_timeout")


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
	
func on_difficulty_timer_timeout() -> void:
	if difficulty_spawn_rate > 0.6:
		difficulty_spawn_rate -= 0.2
	
	# Here, you stop and then start the timer again with the new value
	spawn_timer.stop()
	spawn_timer.start(difficulty_spawn_rate)
	print(str(difficulty_spawn_rate))
	
	spawn_timer.start(difficulty_spawn_rate)
	
	
func on_spawn_timer_timeout():
	spawn_obstacle()
	
func game_started():
	spawn_timer.start(difficulty_spawn_rate)
	difficutly_timer.start(10.0)
#	spawn_timer.start(2)
