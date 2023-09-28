extends Control

@onready var time_value := $VBC/Time/Value
@onready var diamond_value := $VBC/Diamonds/Value

func _ready() -> void:
	GameData.connect("diamond_updated", set_diamond_value)

func set_time_value(value: float):
	time_value.text = format_time(value)
	time_value.show()

func set_diamond_value(value: int):
	diamond_value.text = "%02d" % value
	diamond_value.show()

func format_time(value:float):
	var minutes := value / 60
	var seconds := fmod(value, 60)
	var milliseconds := fmod(value, 1) * 100
	return "%02d:%02d:%02d:" % [minutes, seconds, milliseconds]
