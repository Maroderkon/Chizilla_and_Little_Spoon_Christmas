extends Node2D

onready var spawn_points := $SpawnPoints
onready var spawn_timer := $SpawnTimer
onready var difficutly_timer := $DifficultyTimer

var obstacle := preload("res://Plane.tscn")
var difficulty_spawn_rate := 3.0 setget on_difficulty_spawn_rate_changed
var bird_speed := rand_range(350.0, 500.0)

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
	plane.speed = bird_speed

	
#func on_difficulty_timer_timeout() -> void:
#	if difficulty_spawn_rate > 0.6:
#		difficulty_spawn_rate -= 0.2
#	# Here, you stop and then start the timer again with the new value
#	spawn_timer.stop()
#	spawn_timer.start(difficulty_spawn_rate)
	
func on_difficulty_spawn_rate_changed(new_value):
	if new_value == difficulty_spawn_rate:
		return
	else:
		difficulty_spawn_rate = new_value
	spawn_timer.stop()
	spawn_timer.start(difficulty_spawn_rate)
	
func on_spawn_timer_timeout():
	spawn_obstacle()
	
#func game_started():
#	spawn_timer.start(30.0)
#	difficutly_timer.start(15.0)
#	spawn_timer.start(2)
