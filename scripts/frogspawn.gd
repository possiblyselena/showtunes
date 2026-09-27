extends Node2D

@export var point_1 : Vector2 = Vector2(50,50)
@export var point_2: Vector2 = Vector2(1100, 600)

@onready var frog_visitor : Resource = preload("res://scenes/frog.tscn")
func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	return(random_point_inside)
	
func spawn_frog():
	var frog_instance: Node = frog_visitor.instantiate()
	add_child(frog_instance)
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	frog_instance.set_position(spawn_location)

func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
