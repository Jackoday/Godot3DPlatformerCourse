extends Node3D

@export_file var next_level_scene: String

@onready var transition_animation := $TransitionLayer/AnimationPlayer

func level_clear():
	if next_level_scene:
		transition_animation.play("fade_out")
		await transition_animation.animation_finished
		get_tree().change_scene_to_file(next_level_scene)
