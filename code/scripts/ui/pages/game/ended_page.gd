extends Page

@export var _return_button: BaseButton
@export_file("*.tscn") var _main_scene_path: String


func _ready():
    _return_button.pressed.connect(_on_return_button_clicked)


func _on_return_button_clicked():
    Global.get_scene_manager().load_scene(_main_scene_path)
