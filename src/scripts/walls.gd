@tool
extends StaticBody2D


# @onready var viewport_rect := get_viewport_rect()
@export var corner_offset := 20:
	set(v):
		corner_offset = v
		# if self.is_node_ready():
		update_corners()


func _ready() -> void:
	update_corners()


func update_corners() -> void:
	if not is_node_ready():
		return

	$TopLeft    .shape.distance = corner_offset
	$TopRight   .shape.distance = corner_offset
	$BottomLeft .shape.distance = corner_offset
	$BottomRight.shape.distance = corner_offset

	var sc := corner_offset * sqrt(2)

	for sp in [$SpriteTL, $SpriteTR, $SpriteBL, $SpriteBR]:
		sp.scale = Vector2(sc, sc)
