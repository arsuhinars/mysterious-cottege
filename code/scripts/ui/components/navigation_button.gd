extends BaseButton


@export var _target_page_name: StringName


func _ready():
	pressed.connect(_on_clicked)


func _on_clicked():
	Ui.get_page_manager().go_to(_target_page_name)
