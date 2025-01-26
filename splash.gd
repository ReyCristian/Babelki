extends Control

@export var splash_duration = 5.0  # Duración del splash screen en segundo

func _ready():
	await get_tree().create_timer(splash_duration).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")
