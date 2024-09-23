extends RigidBody2D


@export var speed := 400 # px/s
var velocity := Vector2()


func _ready() -> void:
	velocity = Vector2.from_angle(randf() * 2 * PI) * speed
