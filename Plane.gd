extends Area2D




onready var visibility_enabler := $VisibilityEnabler2D
onready var bird_sprite := $Sprite
onready var hurt_bird_sprite := $HurtBird
onready var animation_player := $animation_player
onready var bird_animation := $BirdAnimation

var speed := rand_range(350.0, 500.0) #450 and 700 #250 and 500
var hurt := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visibility_enabler.connect("screen_exited", self, "on_visibility_enabler_screen_exited")
	connect("area_entered", self, "on_crash_area_entered")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hurt == false:
		global_position.x -= speed * delta
	else:
		global_position.y += speed * delta
	
func on_visibility_enabler_screen_exited() -> void:
	queue_free()

func on_crash_area_entered(area: Area2D):
	hurt = true
	bird_sprite.visible = false
	hurt_bird_sprite.visible = true
	bird_animation.visible = false

	speed = 400
	
