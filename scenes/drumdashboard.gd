extends Sprite2D

@export var step_time: float = 0.25 # Time between beats in seconds

var current_step: int = 0
var is_playing: bool = false
var step_timer: Timer
var beat_nodes: Array[Node] = []

func _ready() -> void:
	hide()
	_setup_timer()
	_collect_beat_columns()

func _setup_timer() -> void:
	step_timer = Timer.new()
	step_timer.wait_time = step_time
	step_timer.one_shot = false
	step_timer.timeout.connect(_on_step_timeout)
	add_child(step_timer)

func _collect_beat_columns() -> void:
	beat_nodes.clear()
	# Finds all beat nodes (beat1, beat2, etc.) under Dashb
	for child in get_children():
		if child.name.begins_with("beat"):
			beat_nodes.append(child)

func start_sequence() -> void:
	if beat_nodes.is_empty():
		return
		
	if is_playing:
		stop_sequence()
		return
		
	is_playing = true
	current_step = 0
	_play_step(current_step)
	step_timer.start()

func stop_sequence() -> void:
	is_playing = false
	step_timer.stop()

func _on_step_timeout() -> void:
	current_step += 1
	
	# Loop back to the start when reaching the last beat column
	if current_step >= beat_nodes.size():
		current_step = 0
		
	_play_step(current_step)

func _play_step(step_idx: int) -> void:
	var current_beat_node := beat_nodes[step_idx]
	
	# Check every button inside the active beat column
	for button in current_beat_node.get_children():
		if button is TextureButton or button is BaseButton:
			# If the button is currently pressed/toggled on
			if button.button_pressed:
				_trigger_button_audio(button)

func _trigger_button_audio(button_node: Node) -> void:
	# Plays the AudioStreamPlayer child inside the pressed button
	for child in button_node.get_children():
		if child is AudioStreamPlayer:
			child.play()

# Signal Connections


func _on_playbutton_pressed() -> void:
	start_sequence()


func _on_backbutton_pressed() -> void:
	stop_sequence()
	hide()

func _on_drum_pressed() -> void:
	show()
