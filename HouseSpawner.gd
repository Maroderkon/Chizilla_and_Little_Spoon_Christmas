extends Node2D

onready var spawn_points := $SpawnPoints
onready var spawn_timer := $Timer

var obstacle := preload("res://House.tscn")

func _ready() -> void:
	randomize()
	spawn_timer.connect("timeout", self, "on_spawn_timer_timeout")
	spawn_timer.start(7)

func _process(delta: float) -> void:
	pass

func get_spawn_position() -> Vector2:
	var points = spawn_points.get_children()
	points.shuffle()
	return points[0].global_position

func spawn_obstacle():
	var spawn_position: Vector2 = get_spawn_position()
	var main = get_tree().current_scene
	var house = obstacle.instance()
	
	# Connect the house signal to the World node method immediately after instantiation
	
	house.connect("score_up", main, "score_up")
	print("Signal connected: ", house.is_connected("score_up", main, "score_up"))
	
	
	# Adding the house to the main node after connecting the signal
	main.add_child(house)
	house.global_position = spawn_position
	
func on_spawn_timer_timeout():
	spawn_obstacle()

#extends Node2D
#
#onready var spawn_points := $SpawnPoints
#onready var spawn_timer := $Timer
#
#var obstacle := preload("res://House.tscn")
#
#onready var world_node = get_tree().current_scene.get_node("World") # Assuming your World node is called "World"
#
#func _ready() -> void:
#	randomize()
#	spawn_timer.connect("timeout", self, "on_spawn_timer_timeout")
#	spawn_timer.start(7)
#
#
#func _process(delta: float) -> void:
#	pass
#
#func get_spawn_position()  -> Vector2:
#	var points := spawn_points.get_children()
#	points.shuffle()
#	return points[0].global_position
#
#func spawn_obstacle():
#	var spawn_position : Vector2 = get_spawn_position()
#	var main := get_tree().current_scene
#	var house := obstacle.instance()
#	main.add_child(house)
#	house.global_position = spawn_position
#
#	# Connect house signal to World node method
#
#	house.connect("score_up", world_node, "score_up")
#
#	print("Signal connected: ", house.is_connected("score_up", world_node, "score_up"))
#
#func on_spawn_timer_timeout():
#	spawn_obstacle()
