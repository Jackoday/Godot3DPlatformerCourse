extends Control

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause") and get_tree().paused == false:
		self.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
		
	elif event.is_action_pressed("ui_cancel") and get_tree().paused == true:
		self.visible = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		get_tree().paused = false


func _on_resume_pressed():
	self.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false


func _on_settings_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	pass # Replace with function body.
