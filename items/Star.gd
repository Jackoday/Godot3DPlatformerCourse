extends Area3D

func _on_body_entered(_body):
	if owner.has_method("level_clear"):
		owner.level_clear()
