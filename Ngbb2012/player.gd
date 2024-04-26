extends Node2D

const DRAG = 0.95

var vel = Vector2.ZERO
var firing : bool = true
@export var damage : float = 25

@export var fireDelta : float : set = set_fire_delta
# milliseconds

# Called when the node enters the scene tree for the first time.
func _ready():
	fireDelta = 0.2
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
		var laser = preload("res://Ngbb2012/Larser.tscn").instantiate()
		get_tree().current_scene.add_child(laser)
		laser.fire(Vector2(cos(rotation - PI / 2) * 10, sin(rotation - PI / 2)) * 10, damage)
		laser.global_position = global_position
		firing = false
		$Timer.start()
		


func _on_timer_timeout():
	firing = true
	
	pass # Replace with function body.

func set_fire_delta(delta):
	fireDelta = delta
	$Timer.wait_time = delta
