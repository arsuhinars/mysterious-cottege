extends State


func _on_entered(old_state_name: StringName):
    super(old_state_name)

    get_tree().paused = true
    Ui.get_page_manager().go_to(Pages.GAME_PAUSED)


func _on_exited():
    get_tree().paused = false
    super()


func _process(_delta):
    if Input.is_action_just_pressed(&"player_pause"):
        _state_machine.set_active_state(GameStateMachine.STATE_STARTED)
