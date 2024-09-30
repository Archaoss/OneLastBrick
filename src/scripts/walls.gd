extends StaticBody2D


@onready var viewport_rect := get_viewport_rect()
@export var corner_offset := 20 # px


func _ready() -> void:
	$TopLeft    .shape.distance = corner_offset
	$TopRight   .shape.distance = corner_offset
	$BottomLeft .shape.distance = corner_offset
	$BottomRight.shape.distance = corner_offset
