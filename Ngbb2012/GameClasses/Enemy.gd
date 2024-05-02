class_name Enemy
extends Node2D

@export var collisionShape : CollisionObject2D
@export var sprite : Sprite2D

@export var health : float

func _process(delta):
	pass
	
func applyDamage(amount : float):
	health = min(health - amount, 0)
	
	var tflash : Tween = get_tree().create_tween()
	tflash.tween_property(self, "modulate", Color(255, 255, 255), 0.2)
	
	if health == 0:
		queue_free()

