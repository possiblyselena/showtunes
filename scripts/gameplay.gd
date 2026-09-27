extends Node2D

@export var node_to_show: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/tutorial.dialogue"), "start")
		return
	pass

# Called every frame. 'delta	' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/tutorial.dialogue"), "start")
		return

	
func _on_dashboard_visibility_changed() -> void:
	show()
