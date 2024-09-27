extends RigidBody2D


@export var speed := 400 # px/s


func _ready() -> void:
	linear_velocity = Vector2.from_angle(randf() * 2 * PI) \
		* speed
