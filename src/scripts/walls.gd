extends StaticBody2D

@onready var viewport_rect := get_viewport_rect()
@export var corner_offset := 10 # px


func _ready():
	$Dummy.queue_free()
	instantiate_walls()
	instantiate_corners()


func instantiate_walls() -> void:
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


func instantiate_corners() -> void:
	var p := viewport_rect.position
	var s := viewport_rect.size
	var o := corner_offset

	var wall : CollisionShape2D

  # bottom left
	wall = CollisionShape2D.new()
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(1, 1)
	wall.position = p + o * wall.shape.normal
	print(wall.shape.normal)
	print(wall.position)
	add_child(wall)

  # bottom right
	wall = CollisionShape2D.new()
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(-1, 1)
	wall.position = Vector2(s.x - o, o)
	print(wall.shape.normal)
	print(wall.position)
	add_child(wall)

	# top left
	wall = CollisionShape2D.new()
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(1, -1)
	wall.position = Vector2(o, s.y - o)
	print(wall.shape.normal)
	print(wall.position)
	add_child(wall)

	# top right
	wall = CollisionShape2D.new()
	wall.shape = WorldBoundaryShape2D.new()
	wall.shape.normal = Vector2(-1, -1)
	wall.position = s + o * wall.shape.normal
	print(wall.shape.normal)
	print(wall.position)
	add_child(wall)
