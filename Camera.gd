extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var parent = get_parent()
onready var translation_offset = translation

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation = parent.translation + translation_offset
