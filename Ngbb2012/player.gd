extends Node2D

const DRAG = 0.95

var vel = Vector2.ZERO
var firing : bool = true
@export var damage : float = 25

@export var fireSpeed : float : set = set_fire_delta
# milliseconds

# Called when the node enters the scene tree for the first time.
func _ready():
	fireSpeed = 0.1
	
	global_position.x = get_window().size.x / 2
	global_position.y = get_window().size.y - 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.x -= Input.get_action_strength("a") - Input.get_action_strength("d")
	vel.x *= DRAG
	rotation_degrees = vel.x
	global_position.x += vel.x
	global_position.x = lerp(global_position.x, clampf(global_position.x, 100, get_window().size.x - 100), 0.3)
	
	if Input.get_action_strength("space") and firing ==true:
		fire()


func fire():
		var laser = preload("res://Ngbb2012/Laser.tscn").instantiate()
		get_tree().current_scene.add_child(laser)
		laser.fire(rotation, 10, damage)
		laser.global_position = global_position
		firing = false
		$Timer.start()
		


func _on_timer_timeout():
	firing = true

func set_fire_delta(delta):
	fireSpeed = delta
	$Timer.wait_time = delta
