extends TextureButton

@export var node_to_show : CanvasItem

func _ready() -> void:
	hide()
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		hide()
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/tutorial.dialogue"), "start")
		get_viewport().set_input_as_handled()
	

func _on_dialogue_ended(resource: DialogueResource) -> void:
	show()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_microphone_pressed() -> void:
	hide()


func _on_dashboard_visibility_changed() -> void:
	show()
