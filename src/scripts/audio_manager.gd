extends Node


const MAX_PLAYERS := 16
const BUS := "master"

@export var ball_hit := preload("res://sounds/tap.wav")

var available := []
var queue := []

var _rand := RandomNumberGenerator.new()


func _ready() -> void:
	for i in MAX_PLAYERS:
		var player := AudioStreamPlayer.new()
		player.bus = BUS
		available.append(player)
		player.finished.connect(_on_finished.bind(player))
		add_child(player)


func _process(_delta: float) -> void:
	if queue.is_empty() or available.is_empty():
		return

	var player = available.pop_front()
	var pitch = _rand.randf_range(1.5, 2.0)
	player.set_pitch_scale(pitch)
	var sound = queue.pop_front()
	player.stream = sound
	player.play()


func play(sound: AudioStream) -> void:
	queue.append(sound)


func _on_finished(player: AudioStreamPlayer) -> void:
	available.append(player)
