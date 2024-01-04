extends Area3D

func _on_body_entered(_body):
	if owner.has_method("level_clear"):
		$SFX.play()
		owner.level_clear()
