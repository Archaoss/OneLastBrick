extends StaticBody2D

@onready var viewport_rect := get_viewport_rect()
@export var diag_offset := 10


func _ready():
	var wall : CollisionShape2D

	wall = CollisionShape2D.new()
	wall.position = viewport_rect.position
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(1, 0)
	add_child(wall)

	wall = CollisionShape2D.new()
	wall.position = viewport_rect.position
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(0, 1)
	add_child(wall)

	wall = CollisionShape2D.new()
	wall.position = viewport_rect.size
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(-1, 0)
	add_child(wall)
	
	wall = CollisionShape2D.new()
	wall.position = viewport_rect.size
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(0, -1)
	add_child(wall)
