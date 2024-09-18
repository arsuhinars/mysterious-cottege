extends BaseButton


@export var _target_page_name: StringName


var _page_manager: PageManager


func _ready():
    _page_manager = Bootstrap.get_page_manager()

    pressed.connect(_on_clicked)


func _on_clicked():
    _page_manager.go_to(_target_page_name)
