extends Node2D

static var marg : int = 100

var speed = 10
var dir = PI / 2
# how much damage the laser fire
var damage : float

# this function is called when firing a laser
func fire(angle : float, speed : float, damage : float):
	self.damage = damage
	
	# set the laser's direction & speed
	self.speed = speed
	dir = angle
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel : Vector2 = Vector2(cos(dir - PI / 2) * speed, sin(dir - PI / 2) * speed)
	look_at(global_position + vel)
	rotate(PI / 2)
	global_position += vel
	edge_check()
	
	
func edge_check():
	if global_position.y < -get_window().size.y - marg: #|| global_position.y > 0 + marg:
		queue_free()
	#elif global_position.x < -100 - marg || global_position.x > 0 + marg:
		#queue_free()


func _on_area_2d_body_entered(body):
	if body is Alien:
		body.applyDamage(damage)
		createExplosion(global_position)
		queue_free()
		
func createExplosion(pos : Vector2):
	var obj = preload("res://Ngbb2012/Effects/Explosion.tscn").instantiate()
	obj.global_position = pos
	get_tree().current_scene.add_child(obj)
