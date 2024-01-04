extends Area3D

func _on_body_entered(_body):
	GameData.diamonds += 1
	$SFX.play()
	$AnimationPlayer.play("pick_up")
