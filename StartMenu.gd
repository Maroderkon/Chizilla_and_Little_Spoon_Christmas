extends Control

onready var restart_button := $VBoxContainer/RestartButton
onready var quit_button := $VBoxContainer/QuitButton
onready var run_score := $VBoxContainer/RunscoreLabel
onready var credits_button := $VBoxContainer/CreditsButton

var _score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart_button.connect("pressed", self, "on_restart_button_pressed")
	quit_button.connect("pressed", self, "on_quit_button_pressed")
	credits_button.connect("pressed", self, "on_credits_button_pressed")
	update_score_label()

func set_score(value: int) -> void:
	_score = value
	update_score_label()

func update_score_label() -> void:
	run_score.text = "SCORE: " + str(_score)

func on_restart_button_pressed() -> void:
	get_tree().change_scene("res://World.tscn")

func on_quit_button_pressed() -> void:
	get_tree().quit()
	
func on_credits_button_pressed() -> void:
	get_tree().change_scene("res://CreditsScreen.tscn")
