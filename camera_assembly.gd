extends Position3D


onready var parent = get_parent()

func _ready():
	set_as_toplevel(true)

func _process(delta):
	global_transform.origin = global_transform.origin.linear_interpolate(parent.global_transform.origin, 0.1)
	#translation = translation.linear_interpolate(parent.translation, 0.1)
