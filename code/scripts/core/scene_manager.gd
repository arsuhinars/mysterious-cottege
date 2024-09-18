class_name SceneManager
extends Node

signal started_loading()
signal finished_loading()

var _is_loading := false
var _loading_progress := 0.0
var _scene_path: String


func is_loading() -> bool:
	return _is_loading


func get_progress() -> float:
	return _loading_progress


func load_scene(path: String) -> bool:
	assert(!_is_loading, "SceneManager is loading another scene")

	var result := ResourceLoader.load_threaded_request(
		path, "PackedScene", true, ResourceLoader.CACHE_MODE_IGNORE
	)
	if result != OK:
		return false

	_is_loading = true
	_scene_path = path

	started_loading.emit()

	return true


func _process(_delta):
	if !_is_loading:
		return
	
	var progress := [0.0]
	var status := ResourceLoader.load_threaded_get_status(_scene_path, progress)

	match status:
		ResourceLoader.THREAD_LOAD_LOADED:
			var scene := ResourceLoader.load_threaded_get(_scene_path) as PackedScene
			get_tree().change_scene_to_packed(scene)

			await get_tree().process_frame

			_is_loading = false
			_loading_progress = 1.0
			finished_loading.emit()
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			_loading_progress = progress[0]
		_:
			pass
