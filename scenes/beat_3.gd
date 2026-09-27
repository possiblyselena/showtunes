extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_drum_pressed() -> void:
	$drum/Drum.play()

func _on_hihat_pressed() -> void:
	$"hihat/Sound(14)".play()
