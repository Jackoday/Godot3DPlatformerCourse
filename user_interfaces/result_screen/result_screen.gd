extends Control

@export_file var level_01: String

@onready var best_times := $MenuContainer/Records/Best/Time/Value
@onready var best_diamonds := $MenuContainer/Records/Best/Diamonds/Value

@onready var current_times := $MenuContainer/Records/Current/Time/Value
@onready var current_diamonds := $MenuContainer/Records/Current/Diamonds/Value

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	current_times.text = format_time(GameData.total_times)
	current_times.show()
	
	current_diamonds.text = "%02d" % GameData.total_diamonds
	current_diamonds.show()
	
	if GameData.total_times < GameData.best_times or GameData.best_times == 0.0:
		GameData.best_times = GameData.total_times
		
	if GameData.total_diamonds > GameData.best_diamonds:
		GameData.best_diamonds = GameData.total_diamonds
		
	best_times.text = format_time(GameData.best_times)
	best_times.show()
	
	best_diamonds.text = "%02d" % GameData.best_diamonds
	best_diamonds.show()
	

func format_time(value:float):
	var minutes := value / 60
	var seconds := fmod(value, 60)
	var milliseconds := fmod(value, 1) * 100
	return "%02d:%02d:%02d:" % [minutes, seconds, milliseconds]


func _on_retry_pressed():
	GameData.total_times = 0.0
	GameData.total_diamonds = 0
	
	get_tree().change_scene_to_file(level_01)
	

func _on_quit_pressed():
	pass # Replace with function body.
