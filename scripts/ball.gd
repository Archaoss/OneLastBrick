extends RigidBody2D

@onready var viewport_width = get_viewport_rect().size;

@export var speed := 400 # px/s
var velocity := Vector2()

func _ready() -> void:
	velocity = Vector2.from_angle(randf()) * speed
	print(velocity)


func _physics_process(delta: float) -> void:
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, viewport_width)
