extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_c_pressed() -> void:
	$C/PianoC1.play()

func _on_d_pressed() -> void:
	$D/PianoD1.play()

func _on_e_pressed() -> void:
	$E/PianoE1.play()

func _on_f_pressed() -> void:
	$F/PianoF1.play()

func _on_g_pressed() -> void:
	$G/PianoG1.play()

func _on_a_pressed() -> void:
	$A/PianoA1.play()

func _on_b_pressed() -> void:
	$B/PianoB1.play()
