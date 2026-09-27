extends Node

@onready var vocal_dashboard: Node2D = $Microphone/Dashboard
@onready var piano_dashboard: Node2D = $Piano/Dashboard
@onready var drum_dashboard: Node2D = $Drum/Dashboard
@onready var finish_button: TextureButton = $finishbutton

func _ready() -> void:
	if finish_button != null:
		finish_button.pressed.connect(_on_finishbutton_pressed)

func play_sequences() -> void:
	
	if vocal_dashboard != null and vocal_dashboard.has_method("start_sequence"):
		vocal_dashboard.start_sequence()
		
	if piano_dashboard != null and piano_dashboard.has_method("start_sequence"):
		piano_dashboard.start_sequence()
		
	if drum_dashboard != null and drum_dashboard.has_method("start_sequence"):
		drum_dashboard.start_sequence()
		

func _on_finishbutton_pressed() -> void:
	play_sequences()
