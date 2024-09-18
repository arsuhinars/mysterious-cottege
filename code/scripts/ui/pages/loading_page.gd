extends Page

@export var _progress_bar: ProgressBar


func _process(_delta):
    var scene_manager := Global.get_scene_manager()
    var progress := scene_manager.get_progress()

    _progress_bar.value = progress
