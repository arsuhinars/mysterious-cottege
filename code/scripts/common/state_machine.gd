class_name StateMachine
extends Node

@export var _states: Array[State]
@export var _initial_state_name: StringName

var _states_dict: Dictionary
var _active_state: State


func get_active_state():
    return _active_state


func set_active_state(state_name: StringName):
    var state = _states_dict.get(state_name)
    assert(state != null, "Given state was not found")
    
    var old_state := _active_state
    _active_state._on_exited()

    _active_state = state
    _active_state._on_entered(old_state.name)


func _ready():
    for state in _states:
        if _states_dict.has(state.name):
            push_warning(
				"States must have unique names. State \"%s\" occur multiple times" % state.name
			)
        
        _states_dict[state.name] = state
    
    var initial_state = _states_dict.get(_initial_state_name)
    assert(initial_state != null, "Initial state was not found")

    _active_state = initial_state
    initial_state._on_entered(&"")
