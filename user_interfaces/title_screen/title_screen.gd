extends Control

@export_file var level_01: String

@onready var main_menu_container := $MainMenuVBC
@onready var settings:= $Settings
@onready var display := $Settings/Display
@onready var audio := $Settings/Audio

func _ready():
	if not MusicManager.title_bgm.is_playing():
		MusicManager.title_bgm.play()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		if settings.visable:
			if display.visable:
				display.hide()
				settings.menu_panel.show()
			elif audio.visable:
				audio.hide()
				settings.menu_panel.show()
			else:
				_on_settings_backed()
		else:
			get_tree().quit()

func _on_start_pressed():
	if MusicManager.title_bgm.is_playing():
		MusicManager.title_bgm.stop()
	
	GameData.total_times = 0.0
	GameData.total_diamonds = 0
	
	get_tree().change_scene_to_file(level_01)

func _on_settings_pressed():
	main_menu_container.hide()
	settings.show()

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_backed():
	settings.hide()
	main_menu_container.show()
