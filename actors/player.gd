extends CharacterBody3D

@export var max_speed: float
@export var acceleration: float
@export var ground_friction: float
@export var air_friction: float
@export var jump_velocity: float
@export var gravity: float

@onready var _model := $Model
@onready var _camera_rig := $CameraRig

var can_double_jump := true

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		can_double_jump = true
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = abs(jump_velocity)
		else:
			if can_double_jump:
				velocity.y = abs(jump_velocity)
				can_double_jump = false
	
	if Input.is_action_just_released("jump") and not is_on_floor() and velocity.y > 0:
		velocity.y *= 0.25
	
	var input_direction := Vector3.ZERO
	input_direction.x = Input.get_axis("left", "right")
	input_direction.z = Input.get_axis("forward", "backward")
	input_direction = input_direction.rotated(Vector3.UP, _camera_rig.global_rotation.y).normalized()
	
	if input_direction:
		velocity.x = lerp(velocity.x, input_direction.x * max_speed, acceleration)
		velocity.z = lerp(velocity.z, input_direction.z * max_speed, acceleration)
		
		var look_direction := Vector2(input_direction.z, input_direction.x)
		_model.global_rotation.y = look_direction.angle()
	else:
		if is_on_floor():
			velocity.x = lerp(velocity.x, 0.0, ground_friction)
			velocity.z = lerp(velocity.z, 0.0, ground_friction)
		else:
			velocity.x = lerp(velocity.x, 0.0, air_friction)
			velocity.z = lerp(velocity.z, 0.0, air_friction)
	
	move_and_slide()
