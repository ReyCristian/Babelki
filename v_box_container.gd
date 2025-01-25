extends VBoxContainer

#@onready var menu: AudioStreamPlayer2D = $Menu

var pre_creditos = preload("res://creditos.tscn")
var previous_scene: PackedScene


func _on_inicio_pressed() -> void: #inicio el juego
#	$Menu.stream_paused = true
	get_tree().change_scene_to_file("res://main.tscn")  


func _on_opciones_pressed() -> void:
#	$Menu.stream_paused = true
	get_tree().change_scene_to_file("res://menu_opcion.tscn")  # Cargo el menú de opciones


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_inicio_mouse_entered() -> void:
	$"Botón2".play()

func _on_opciones_mouse_entered() -> void:
	$"Botón2".play()



func _on_creditos_pressed() -> void:
	$Creditos.disabled = true;
	var creditos :Creditos= pre_creditos.instantiate();
	add_child(creditos)
	if Global.creditos:
		termina_creditos()
	else:
		creditos.termina.connect(termina_creditos);

func termina_creditos():
	$Creditos.disabled = false;
	


func _on_salir_mouse_entered() -> void:
	$"Botón2".play()

func _on_creditos_mouse_entered() -> void:
	$"Botón2".play()
