extends Page

const AUDIO_BUS_SOUND = &"Sounds";
const AUDIO_BUS_MUSIC = &"Music";

@export var _sound_volume_slider: Slider
@export var _music_volume_slider: Slider

@onready var _sound_bus_idx := AudioServer.get_bus_index(AUDIO_BUS_SOUND)
@onready var _music_bus_idx := AudioServer.get_bus_index(AUDIO_BUS_SOUND)


static func volume_db_to_linear(volume: float) -> float:
    return pow(10.0, volume / 20.0) 


static func volume_linear_to_db(volume: float) -> float:
    return log(volume) / log(10.0) * 20.0


func show_page():
    super()

    _sound_volume_slider.value = volume_db_to_linear(
        AudioServer.get_bus_volume_db(_sound_bus_idx)
    )
    _music_volume_slider.value = volume_db_to_linear(
        AudioServer.get_bus_volume_db( _music_bus_idx)
    )


func _ready():
    _sound_volume_slider.changed.connect(_on_sound_volume_changed)


func _on_sound_volume_changed(value: float):
    AudioServer.set_bus_volume_db(
        _sound_bus_idx, volume_linear_to_db(value)
    )


func _on_music_volume_changed(value: float):
    AudioServer.set_bus_volume_db(
        _music_bus_idx, volume_linear_to_db(value)
    )
