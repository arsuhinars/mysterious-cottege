extends Page

@export var _start_button: BaseButton
@export var _exit_button: BaseButton
@export_file("*.tscn") var _game_scene_path: String


func _ready():
	_start_button.pressed.connect(_on_start_clicked)
	_exit_button.pressed.connect(_on_exit_clicked)


func _on_start_clicked():
	Global.get_scene_manager().load_scene(_game_scene_path)


func _on_exit_clicked():
	get_tree().quit()
