extends CharacterBody2D


@onready var viewport_size = get_viewport_rect().size;

@export var width:  int = 50
@export var height: int = 10
@export var speed:  int = 100


func _ready():
# 	transform.origin = Vector2(viewport_width.x / 2, 40)
	position.x = viewport_size.x / 2;
	position.y = viewport_size.y - 40;
	pass


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta

	var gab = Vector2(width, height)
	position = position.clamp(gab, viewport_size - gab)
