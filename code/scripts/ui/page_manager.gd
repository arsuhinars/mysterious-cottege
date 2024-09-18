class_name PageManager
extends Node


signal page_changed(page_name: StringName)


@export var _pages: Array[Page]
@export var _initial_page_name: StringName


var _page_dict: Dictionary
var _curr_page


func go_to(page_name: StringName):
	if !_page_dict.has(page_name):
		assert(false, "Page \"%s\" was not found" % page_name)

	if _curr_page != null:
		_curr_page.hide_page()

	_curr_page = _page_dict[page_name]
	_curr_page.show_page()

	page_changed.emit(page_name)


func get_page(page_name: StringName) -> Page:
	if !_page_dict.has(page_name):
		assert(false, "Page \"%s\" was not found" % page_name)

	return _page_dict[page_name] as Page


func _ready():
	for page in _pages:
		if _page_dict.has(page.name):
			push_warning(
				"Pages must have unique names. Page \"%s\" occur multiple times" % page.name
			)

		_page_dict[page.name] = page

		if page.name == _initial_page_name:
			_curr_page = page
			page.show_page()
		else:
			page.hide_page()

	if _curr_page == null && !_initial_page_name.is_empty():
		push_warning("Initial page \"%s\" was not found" % _initial_page_name)

	if _curr_page != null:
		page_changed.emit(_curr_page.name)
