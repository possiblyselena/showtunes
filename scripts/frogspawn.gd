extends Node2D

@export var point_1 : Vector2 = Vector2(-200, 0)
@export var point_2 : Vector2 = Vector2(500, 400)

@onready var frog_visitor : PackedScene = preload("res://scenes/frog.tscn")

func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	return Vector2(x_value, y_value)

func spawn_frog() -> void:
	var frog_instance = frog_visitor.instantiate()
	
	# Set Z Index to render above other nodes (default is 0)
	frog_instance.z_index = 10 
	
	add_child(frog_instance)
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	frog_instance.global_position = spawn_location
	
	print("Frog spawned at: ", frog_instance.global_position)
