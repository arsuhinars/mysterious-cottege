class_name GameStateMachine
extends StateMachine

const STATE_STARTED = &"Started"
const STATE_PAUSED = &"Paused"
const STATE_ENDED = &"Ended"


func _enter_tree():
    Global.provide_game_state_machine(self)


func _exit_tree():
    Global.release_game_state_machine(self)
