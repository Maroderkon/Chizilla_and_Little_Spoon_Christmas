extends Node2D


onready var player := $Player
onready var canvas := $CanvasLayer

var Menu := preload("res://Menu.tscn")
var score := 0

onready var highscore := $CanvasLayer/MarginContainer/HighScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("player_dead", self, "add_menu_screen")


func add_menu_screen() -> void:
	var main := canvas
	var menu := Menu.instance()
	main.add_child(menu)
	
func score_up() -> void:
	print("score up method called")
	score += 1
	highscore.text = str(score)
