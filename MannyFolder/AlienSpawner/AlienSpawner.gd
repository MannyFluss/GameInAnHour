extends Node2D

var alienPrefab = preload("res://MannyFolder/Alien/Alien.tscn")
# Called when the node enters the scene tree for the first time.


func _on_timer_timeout():
	var newInstance = alienPrefab.instantiate()
	newInstance.position = Vector2(randf_range(0,get_window().size.x),0)
	
	add_child(newInstance)
