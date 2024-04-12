extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = preload("res://Ngbb2012/player.tscn").instantiate()
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
