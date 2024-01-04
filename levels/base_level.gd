extends Node3D

@export_file var next_level_scene: String
@export_file var result_screen: String

@onready var transition_animation := $TransitionLayer/AnimationPlayer
@onready var hud := $UILayer/HUD

var times : float

func _ready() -> void:
	if not MusicManager.level_bgm.is_playing():
		MusicManager.level_bgm.play()

func _process(delta:float) -> void:
	times += delta
	hud.set_time_value(times)

func level_clear():
	if next_level_scene:
		transition_animation.play("fade_out")
		await transition_animation.animation_finished
		
		GameData.total_times += times
		GameData.total_diamonds += GameData.diamonds
		
		GameData.diamonds = 0
		
		get_tree().change_scene_to_file(next_level_scene)
		
	else:
		transition_animation.play("fade_out")
		await transition_animation.animation_finished
		
		GameData.total_times += times
		GameData.total_diamonds += GameData.diamonds
		
		GameData.diamonds = 0
		
		if MusicManager.level_bgm.is_playing():
			MusicManager.level_bgm.stop()
			
		get_tree().change_scene_to_file(result_screen)
