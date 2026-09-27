extends TextureButton

@export var node_to_show: CanvasItem

func _ready() -> void:
	hide()
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	show()
