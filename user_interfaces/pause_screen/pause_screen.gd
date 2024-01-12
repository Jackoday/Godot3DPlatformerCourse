extends Control

@export_file var title_screen: String

@onready var menu_panel:= $MenuPanel
@onready var settings := $Settings
@onready var display := $Settings/Display
@onready var audio := $Settings/Audio

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause") and get_tree().paused == false:
		self.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
		
	elif event.is_action_pressed("ui_cancel") and get_tree().paused == true:
		
		if settings.visible:
			if display.visable:
				display.hide()
				settings.menu_panel.show()
			elif audio.visable:
				audio.hide()
				settings.menu_panel.show()
			else:
				_on_settings_backed()
		else:
			self.visible = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_tree().paused = false


func _on_resume_pressed():
	self.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false


func _on_settings_pressed():
	menu_panel.hide()
	settings.show()

func _on_quit_pressed():
	get_tree().paused = false
	
	if MusicManager.level_bgm.is_playing():
		MusicManager.level_bgm.stop()
		
	get_tree().change_scene_to_file(title_screen)


func _on_settings_backed():
	settings.hide()
	menu_panel.show()
