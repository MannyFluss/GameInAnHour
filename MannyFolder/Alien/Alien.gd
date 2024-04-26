extends RigidBody2D
class_name Alien

@export
var initailHealth = 100

var health = initailHealth

# Called when the node enters the scene tree for the first time.
@export
var myTarget : Node2D

@export
var mySpeed = 30

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.y > get_window().size.y + 100:
		timeToGetDestroyed()


func _on_timer_timeout():
	var targetDirection = Vector2.DOWN
	apply_impulse(targetDirection * mySpeed)

func timeToGetDestroyed():
	queue_free()
	pass

func applyDamage(damage : float):
	health = max(health - damage, 0)
	if health <= 0:
		timeToGetDestroyed()
	
	
	
