class_name Page
extends Control


signal page_showed
signal page_hidden


## When `true` script won't change `visible` and `z_index` properties of Control
@export var _no_visibily_control: bool = false


func show_page():
    set_process(true)
    set_physics_process(true)

    if !_no_visibily_control:
        z_index = 1
        visible = true
    
    page_showed.emit()


func hide_page():
    set_process(false)
    set_physics_process(false)
    
    if !_no_visibily_control:
        z_index = 0
        visible = false
    
    page_hidden.emit()
