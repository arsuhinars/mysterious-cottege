extends Node


func _ready():
    var scene_manager := Global.get_scene_manager()
    scene_manager.started_loading.connect(_on_started_loading)


func _on_started_loading():
    Ui.get_page_manager().go_to(Pages.LOADING_LEVEL)
