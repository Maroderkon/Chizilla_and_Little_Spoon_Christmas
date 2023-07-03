extends Control

const HIGH_SCORE_PATH = "user://HighScore.tres"

onready var restart_button := $VBoxContainer/RestartButton
onready var quit_button := $VBoxContainer/QuitButton
onready var run_score := $VBoxContainer/RunscoreLabel
onready var highscore_label := $VBoxContainer/HighscoreLabel

var _score := 0
var highscore := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart_button.connect("pressed", self, "on_restart_button_pressed")
	quit_button.connect("pressed", self, "on_quit_button_pressed")
	update_score_label()
	update_highscore()

func set_score(value: int) -> void:
	_score = value
	update_score_label()
	update_highscore()

func update_score_label() -> void:
	run_score.text = "SCORE: " + str(_score)

func on_restart_button_pressed() -> void:
	get_tree().change_scene("res://World.tscn")

func on_quit_button_pressed() -> void:
	get_tree().quit()

func update_highscore() -> void:
	if _score > load_high_score():
		save_high_score(_score)
		highscore = _score
	else:
		highscore = load_high_score()
	highscore_label.text = "HIGH SCORE: " + str(highscore)
	
func save_high_score(score: int) -> void:
	var high_score_resource: HighScoreResource
	if ResourceLoader.exists(HIGH_SCORE_PATH):
		high_score_resource = load(HIGH_SCORE_PATH) as HighScoreResource
	else:
		high_score_resource = HighScoreResource.new()
		
	high_score_resource.high_score = score
	ResourceSaver.save(HIGH_SCORE_PATH, high_score_resource)

func load_high_score() -> int:
	if ResourceLoader.exists(HIGH_SCORE_PATH):
		var high_score_resource = load(HIGH_SCORE_PATH) as HighScoreResource
		return high_score_resource.high_score
	else:
		return 0 
