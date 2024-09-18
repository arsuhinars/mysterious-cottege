extends Node


@export var _fader: Fader
@export var _page_manager: PageManager


func get_fader() -> Fader:
    return _fader


func get_page_manager() -> PageManager:
    return _page_manager
