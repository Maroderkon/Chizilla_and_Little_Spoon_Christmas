extends Control

onready var restart_button := $VBoxContainer/RestartButton
onready var quit_button := $VBoxContainer/QuitButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart_button.connect("pressed", self, "on_restart_button_pressed")
	quit_button.connect("pressed", self, "on_quit_button_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func on_restart_button_pressed() -> void:
	get_tree().change_scene("res://World.tscn")
	
func on_quit_button_pressed() -> void:
	get_tree().quit()
