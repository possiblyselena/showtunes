extends TextureButton

@export var node_to_show: CanvasItem

# Removed @export so Godot inspector doesn't overwrite this value
var dialogue_played: bool = false

func _ready() -> void:
	hide()
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _unhandled_input(event: InputEvent) -> void:
	pass

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	show()
