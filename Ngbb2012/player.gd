extends Node2D

const DRAG = 0.95

var vel = Vector2.ZERO

var time_since_fired : float = 0

# setting the stats for the player
@export var damage : float = 25
@export var fireRate : float = 0.1
@export var fireSpeed : float = 10
@export var penetration : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	fireSpeed = 10
	
	global_position.x = get_window().size.x / 2
	global_position.y = get_window().size.y - 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_fired += delta
	vel.x -= Input.get_action_strength("a") - Input.get_action_strength("d")
	vel.x *= DRAG
	rotation_degrees = vel.x
	global_position.x += vel.x
	global_position.x = lerp(global_position.x, clampf(global_position.x, 100, get_window().size.x - 100), 0.3)
	
	if Input.get_action_strength("space") and time_since_fired >= fireRate:
		fire()


func fire():
	var laser = preload("res://Ngbb2012/Laser.tscn").instantiate()
	get_tree().current_scene.add_child(laser)
	laser.fire(rotation, fireSpeed, damage, penetration)
	laser.global_position = global_position
	time_since_fired = 0
