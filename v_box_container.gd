extends VBoxContainer

#@onready var menu: AudioStreamPlayer2D = $Menu

var previous_scene: PackedScene


func _on_inicio_pressed() -> void: #inicio el juego
#	$Menu.stream_paused = true
	get_tree().change_scene_to_file("res://main.tscn")  


func _on_opciones_pressed() -> void:
#	$Menu.stream_paused = true
	get_tree().change_scene_to_file("res://menu_opcion.tscn")  # Cargo el menú de opciones
