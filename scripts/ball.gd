extends RigidBody2D


@export var speed := 400 # px/s
var velocity := Vector2()


func _ready() -> void:
	velocity = Vector2.from_angle(randf()) * speed


func _physics_process(delta: float) -> void:
	position += velocity * delta
	var infocol = move_and_collide(velocity * delta)
# 	if infocol:
# 		print(infocol)
