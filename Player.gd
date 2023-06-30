extends KinematicBody2D

export var gravity: float = 1600.0
export var flap_strength: float = 600.0
export var max_fall_speed: float = 2000.0

var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Apply gravity to the bird's vertical velocity
	velocity.y += gravity * delta
	
	# Limit the falling speed
	#velocity.y = min(velocity.y, max_fall_speed)
	
	# Check if the player has pressed the flap button
	if Input.is_action_just_pressed("ui_up"):
		# Apply a negative velocity to make the bird move upwards
		velocity.y = -flap_strength
	
	# Move the bird
	move_and_slide(velocity, Vector2.UP)









#extends KinematicBody2D
#
#const SPEED := 1400
##const Bullet : PackedScene = preload("res://DaggerBullet.tscn")
#
#export var gravity := 3000.0
#export var boost_strength := 10000 #1600
#var max_gravity = 25000
#
#onready var sprite := $Sprite
#
#var horizontal_direction : float = 0.0
#var velocity := Vector2.ZERO
#var acceleration_factor := 0.1
#var deceleration_factor := 0.05
#var selected := true
#var player := 2
#var interact: String = ""
#var shoot: String = ""
#var boost: String = ""
#var dagger_ammo: int = 0
#
#func _ready() -> void:
#	pass
#
#func _process(delta: float) -> void:
#	match player:
#		0:
#			horizontal_direction = 0.0
#			interact = "" 
#			shoot = ""
#			boost = ""	
#		1 : 
#			horizontal_direction = Input.get_axis("move_left", "move_right")
#			interact = "interact" 
#			shoot = "shoot"
#			boost = "move_up" 
#		2 : 
#			horizontal_direction = Input.get_axis("move_left2", "move_right2")
#			interact = "interact2" 
#			shoot = "shoot2"
#			boost = "ui_up"
#		3 : 
#			horizontal_direction = Input.get_axis("move_left3", "move_right3")
#			interact = "interact3" 
#			shoot = "shoot3"
#			boost = "jump3" 
#		4 : 
#			horizontal_direction = Input.get_axis("move_left4", "move_right4")
#			interact = "interact4" 
#			shoot = "shoot4"
#			boost = "jump4"
#
#	var desired_x_velocity = SPEED * horizontal_direction
#
#	if horizontal_direction != 0:
#		velocity.x = lerp(velocity.x, desired_x_velocity, acceleration_factor)
#	else:
#		velocity.x = lerp(velocity.x, desired_x_velocity, deceleration_factor)
#
#	if is_on_floor():
#		gravity = 0
#		velocity.y = 0
#	elif selected:
#		gravity = 2000 #3000
#		velocity.y += gravity * delta
#
#	velocity.y = clamp(velocity.y, 0, max_gravity)
##
##	if Input.is_action_just_pressed(shoot):
##		shoot()
#
#	if Input.is_action_just_pressed(boost):
#		velocity.y = -boost_strength
#
#	if selected:
#		move_and_slide(velocity, Vector2.UP)
#
#		if Input.is_action_just_pressed(interact):
#			return
#			sprite.flip_h = not sprite.flip_h























#func shoot():
#	if dagger_ammo >= 1:
#		dagger_ammo -= 1
#		var bullet = Bullet.instance()
#		var main = get_tree().current_scene
#		main.add_child(bullet)
#		bullet.global_position = global_position
#		if sprite.flip_h == false:
#			bullet.direction = Vector2.RIGHT 
#		else:
#			bullet.direction = Vector2.LEFT