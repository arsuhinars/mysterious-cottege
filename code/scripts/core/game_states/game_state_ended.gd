extends State


func _on_entered(old_state_name: StringName):
    super(old_state_name)

    Ui.get_page_manager().go_to(Pages.GAME_ENDED)


func _on_exited():
    super()
