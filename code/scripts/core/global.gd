extends Node

@export var _scene_manager: SceneManager

var _game_state_machine


func get_scene_manager() -> SceneManager:
	return _scene_manager


func get_game_state_machine() -> GameStateMachine:
	assert(_game_state_machine is GameStateMachine, "GameStateMachine is not set")
	return _game_state_machine


func provide_game_state_machine(state_machine: GameStateMachine):
	assert(state_machine == null, "Only one GameStateMachine can be provided")
	_game_state_machine = state_machine


func release_game_state_machine(state_machine: GameStateMachine):
	assert(state_machine == _game_state_machine, "Only same GameStateMachine should be released")
	_game_state_machine = null
