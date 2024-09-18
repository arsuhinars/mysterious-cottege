class_name LevelManager
extends Node


signal level_started_loading()
signal level_finished_loading()


func get_loading_progress() -> float:
	return 0.0


func load_level(name: StringName):
	pass
