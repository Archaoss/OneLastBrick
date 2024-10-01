extends RigidBody2D


@export var speed := 400 # px/s


func _ready() -> void:
	linear_velocity = Vector2.from_angle(randf() * 2 * PI) \
		* speed


func _on_body_entered(body: Node) -> void:
	AudioManager.play(AudioManager.ball_hit)
