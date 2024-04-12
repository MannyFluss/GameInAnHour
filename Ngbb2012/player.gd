extends Node2D

const DRAG = 0.95

var vel = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.x = get_window().size.x / 2
	global_position.y = get_window().size.y - 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.x -= Input.get_action_strength("a") - Input.get_action_strength("d")
	vel.x *= DRAG
	global_position.x += vel.x
	global_position.x = lerp(global_position.x, clampf(global_position.x, 100, get_window().size.x - 100), 0.3)
	
	if Input.get_action_strength("space"):
		var laser = preload("res://Ngbb2012/Larser.tscn").instantiate()
		get_tree().current_scene.add_child(laser)
		laser.fire(Vector2(0, -10))
		laser.global_position = global_position
