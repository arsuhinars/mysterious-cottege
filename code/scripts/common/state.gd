class_name State
extends Node

signal entered
signal exited

@warning_ignore("unused_private_class_variable")
@export var _state_machine: StateMachine


@warning_ignore("unused_parameter")
func _on_entered(old_state_name: StringName):
    set_process(true)
    set_physics_process(true)
    set_process_input(true)

    entered.emit()


func _on_exited():
    set_process(false)
    set_physics_process(false)
    set_process_input(false)

    exited.emit()


func _ready():
    _on_exited()
