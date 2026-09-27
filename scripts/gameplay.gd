extends Node2D

@export var node_to_show: Sprite2D
@onready var frog_spawner = %frogspawn
@onready var spawn_timer = $Node2D/Timer

const balloon_scene = preload("res://dialogue/balloon.tscn")

var sequence_started: bool = false

func _ready() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if not event.is_pressed() or event.is_echo():
		return

	if event.is_action_pressed("ui_accept"):
		if not sequence_started:
			sequence_started = true
			set_process_unhandled_input(false)
			get_viewport().set_input_as_handled()
			play_dialogue_sequence()

func play_dialogue_sequence() -> void:
	var balloon = balloon_scene.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(load("res://dialogue/tutorial.dialogue"), "start")

func _on_dashboard_visibility_changed() -> void:
	show()

func _on_finishbutton_pressed() -> void:
	frog_spawner.spawn_frog()
