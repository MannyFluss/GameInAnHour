extends RigidBody2D
class_name Alien

# Called when the node enters the scene tree for the first time.
@export
var myTarget : Node2D

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var targetDirection = Vector2.DOWN
	apply_impulse(targetDirection * 8)
	
	
