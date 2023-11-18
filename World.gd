extends Node2D



onready var player := $Player
onready var canvas := $CanvasLayer
onready var obstacle_spawner := $ObstacleSpawner
onready var house_spawner := $HouseSpawner
onready var ground := $Ground
onready var ground_spawner := $GroundSpawner
onready var tutorial := $Tutorial


var Menu := preload("res://Menu.tscn")
var score := 0

onready var highscore := $CanvasLayer/MarginContainer/HighScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("player_dead", self, "add_menu_screen")
	player.connect("start_game", house_spawner, "game_started")
	player.connect("start_game", obstacle_spawner, "game_started")
	ground.connect("spawn_ground", ground_spawner, "signal_test")
	player.connect("start_game", tutorial, "queue_free")
	
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
	if score == 5:
		if obstacle_spawner.spawn_timer.is_stopped():
			obstacle_spawner.spawn_timer.start(3.0)
	elif score == 10:
		obstacle_spawner.difficulty_spawn_rate = 2.8
	elif score == 12:
		obstacle_spawner.difficulty_spawn_rate = 2.6
	elif score == 15:
		obstacle_spawner.difficulty_spawn_rate = 2.4
	elif score == 17:
		obstacle_spawner.difficulty_spawn_rate = 2.2
	elif score == 20:
		obstacle_spawner.difficulty_spawn_rate = 2.0
		obstacle_spawner.bird_speed = rand_range(400, 600)
	elif score == 22:
		obstacle_spawner.difficulty_spawn_rate = 1.6
	elif score == 25:
		obstacle_spawner.difficulty_spawn_rate = 1.2
		obstacle_spawner.bird_speed = rand_range(450, 650)
	elif score == 27:
		obstacle_spawner.difficulty_spawn_rate = 1.0
	elif score == 30:
		obstacle_spawner.difficulty_spawn_rate = 0.8
	elif score == 35:
		obstacle_spawner.difficulty_spawn_rate = 0.6
		obstacle_spawner.bird_speed = rand_range(450, 700)
	elif score == 40:
		obstacle_spawner.difficulty_spawn_rate = 0.6
	elif score == 45:
		obstacle_spawner.difficulty_spawn_rate = 0.6
		obstacle_spawner.bird_speed = rand_range(550, 700)

	
func start_game() -> void:
	pass
