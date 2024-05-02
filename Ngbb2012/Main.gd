extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = preload("res://Ngbb2012/player.tscn").instantiate()
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_key_input(event):
	if Input.is_action_pressed("esc"):
		get_tree().quit(0)
