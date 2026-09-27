extends CharacterBody2D

@export var speed: float = 100.0
var direction: int = 1 # 1 means Right, -1 means Left

@onready var timer: Timer = $Timer
@onready var sprite: Sprite2D = $Sprite2D # Change to AnimatedSprite2D if using animations

func _ready() -> void:
	# Connect the timer's timeout signal to our turn function
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta: float) -> void:
	# Apply horizontal movement
	velocity.x = direction * speed


	move_and_slide()
	update_sprite_facing()

func _on_timer_timeout() -> void:
	# Flip direction: 1 becomes -1, -1 becomes 1
	direction = -direction

func update_sprite_facing() -> void:
	if direction > 0:
		sprite.flip_h = false # Facing right
	elif direction < 0:
		sprite.flip_h = true  # Facing left
