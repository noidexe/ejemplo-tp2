extends RigidBody

onready var ground_sensor = $ground_sensor

var running_speed := 1000.0
var boost_speed := 5000.0

var max_jumps = 2
var remaining_jumps : int = max_jumps

onready var camera = $camera_assembly


var on_floor = false

func apply_boost():
	pass

func _integrate_forces(state):
	var jump_pressed = false
	var dir := Vector3()
	dir.x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	dir.z = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	dir = dir.rotated(Vector3.UP, camera.rotation.y).normalized()
	dir.y = int(Input.is_action_just_pressed("ui_select"))
	jump_pressed = dir.y > 0
	state.linear_velocity.x = lerp (state.linear_velocity.x, dir.x * running_speed * state.step, 0.2 )
	state.linear_velocity.z = lerp (state.linear_velocity.z, dir.z * running_speed * state.step, 0.2 )

	if ground_sensor.is_colliding():
		if not on_floor:
			on_floor = true
			remaining_jumps = max_jumps
	else:
		on_floor = false
	
	
	if jump_pressed and remaining_jumps:
		state.linear_velocity.y = dir.y * 1000 * state.step
		remaining_jumps -= 1
