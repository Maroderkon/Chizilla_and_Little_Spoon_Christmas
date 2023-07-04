extends Node2D

onready var next_button := $CanvasLayer/VBoxContainer/NextButton
onready var back_button := $CanvasLayer/VBoxContainer/BackButton

var start_screen := preload("res://StartScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_button.connect("pressed", self, "on_next_button_pressed")
	back_button.connect("pressed", self, "on_back_button_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func on_next_button_pressed():
	get_tree().change_scene("res://CreditsScreen3.tscn")
	
func on_back_button_pressed():
	get_tree().change_scene("res://StartScreen.tscn")
