class_name Fader
extends Control

const FADE_DURATION_SHORT = 0.2
const FADE_DURATION_NORMAL = 0.5
const FADE_DURATION_LONG = 1.0

@export_color_no_alpha var _fade_color: Color

var _state := false
var _tween


func set_state(target_state: bool):
	if _tween is Tween:
		_tween.kill()

	_state = target_state
	_tween = create_tween()

	if target_state:
		_tween.tween_property(self, ^"modulate", Color(_fade_color, 1.0))
	else:
		_tween.tween_property(self, ^"modulate", Color(_fade_color, 0.0))


func _ready():
	modulate = Color(_fade_color, 0.0)
