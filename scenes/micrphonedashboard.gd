extends Sprite2D

@export var node_to_show: CanvasItem

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	pass

func _on_microphone_pressed() -> void:
	show()
	pass # Replace with function body.
