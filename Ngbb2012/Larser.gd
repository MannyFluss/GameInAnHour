extends Node2D

var vel = Vector2.ZERO

var larserDamage : float

func fire(vec2, damage):
	larserDamage = damage
	vel = vec2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(global_position + vel)
	rotate(PI / 2)
	global_position += vel
	edge_check()
	
	
func edge_check():
	if global_position.y < -100:
		queue_free()


func _on_area_2d_body_entered(body):
	if body is Alien:
		body.applyDamage(larserDamage)
		queue_free()
