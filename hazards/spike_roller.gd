extends AnimatableBody3D

func _on_hit_area_body_entered(body):
	if body.has_method("respawn"):
		body.respawn()
