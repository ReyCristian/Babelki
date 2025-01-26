extends Button

@export var web=true;
@export var touch=false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.get_name() == "Web" and web:
		hide()
	if DisplayServer.is_touchscreen_available() and touch:
		hide()
	pass # Replace with function body.
