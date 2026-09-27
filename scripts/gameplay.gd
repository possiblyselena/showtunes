extends Node2D

@export var node_to_show: Sprite2D
@onready var frog_spawner = %frogspawn
@onready var spawn_timer = $Node2D/Timer

var sequence_started: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if not event.is_pressed() or event.is_echo():
		return

	if event.is_action_pressed("ui_accept"):
		if not sequence_started:
			sequence_started = true
			
			# 1. Stop this node from EVER processing unhandled input again!
			set_process_unhandled_input(false)
			
			# 2. Mark input as handled for this frame
			get_viewport().set_input_as_handled()
			
			# 3. Start sequence
			play_dialogue_sequence()

func play_dialogue_sequence() -> void:
	# Show Tutorial Dialogue
	DialogueManager.show_example_dialogue_balloon(
		load("res://dialogue/tutorial.dialogue"), 
		"start"
	)
		
	# Wait until tutorial finishes
	await DialogueManager.dialogue_ended
	
	# Show Microphone Dialogue immediately after
	DialogueManager.show_example_dialogue_balloon(
		load("res://dialogue/microphone.dialogue"), 
		"start"
	)

func _on_dashboard_visibility_changed() -> void:
	show()

func _on_timer_timeout() -> void:
	if frog_spawner != null:
		frog_spawner.spawn_frog()
		print("frog")
