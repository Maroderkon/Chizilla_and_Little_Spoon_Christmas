extends Node2D



onready var player := $Player
onready var canvas := $CanvasLayer
onready var obstacle_spawner := $ObstacleSpawner
onready var house_spawner := $HouseSpawner
onready var ground := $Ground
onready var ground_spawner := $GroundSpawner

var Menu := preload("res://Menu.tscn")
var score := 0

onready var highscore := $CanvasLayer/MarginContainer/HighScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("player_dead", self, "add_menu_screen")
	ground.connect("spawn_ground", ground_spawner, "signal_test")
func _process(delta: float) -> void:
	pass

func add_menu_screen() -> void:
	var main := canvas
	var menu := Menu.instance()
	main.add_child(menu)
	menu.set_score(score)
	
func score_up() -> void:
	score += 1
	highscore.text = str(score)
	
func start_game() -> void:
	pass
