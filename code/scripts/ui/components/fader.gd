class_name Fader
extends Control

const FADE_DURATION_SHORT = 0.2
const FADE_DURATION_NORMAL = 0.5
const FADE_DURATION_LONG = 1.0

signal fade_finished

@export_color_no_alpha var _fade_color: Color

var _is_fading := false
var _state := false
var _tween


func is_fading() -> bool:
	return _is_fading


func set_state(target_state: bool, duration := FADE_DURATION_NORMAL):
	if _tween is Tween:
		_tween.kill()

	_is_fading = true
	_state = target_state
	_tween = create_tween()

	_tween.tween_property(
		self,
		^"modulate",
		Color(_fade_color, 1.0 if target_state else 0.0),
		duration
	)
	_tween.tween_callback(func ():
		_is_fading = false
		fade_finished.emit()
	)


func _ready():
	modulate = Color(_fade_color, 0.0)
