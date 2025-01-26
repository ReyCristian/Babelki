extends VBoxContainer

@onready var music_volume_slider = $music
@onready var master_volume_slider = $master
@onready var efect_volumen_slider=$Efect


func _ready():
	## Inicializar sliders con el volumen actual de los buses de audio
	var sonido_master= AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	var slider_master = sqrt(10000*db_to_linear(sonido_master))
	$master.value= slider_master
  
	var sonido_musica= AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Musica"))
	var slider_musica= sqrt(10000*db_to_linear(sonido_musica))
	$music.value=slider_musica
	var sonido_efecto= AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Efecto"))
	var slider_efecto= sqrt(10000*db_to_linear(sonido_efecto))
	$Efect.value=slider_efecto
	#if get_tree().current_scene.name=="Menu_Opciones":
	#	$menu.play() Esto reproduce la musica
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		$fullscreen_button/Label.text = "MODO VENTANA"
	else:
		$fullscreen_button/Label.text = "PANTALLA COMPLETA"
	


func _on_master_value_changed(value: float) -> void:
	var db_value = linear_to_db(0.0001*pow(value,2))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_value)

func _on_music_value_changed(value: float) -> void:
	var db_value =  linear_to_db(0.0001*pow(value,2))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"),db_value)

func _on_efect_value_changed(value: float) -> void:
	var db_value = linear_to_db(0.0001*pow(value,2))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Efecto"),db_value)

func _on_volver_pressed() -> void:
	if get_tree().current_scene.name=="Menu_Opcion":
		get_tree().change_scene_to_file("res://main_menu.tscn")#vuelve al main
	else:
		get_tree().get_first_node_in_group("menu_pause").visible=true
		$"..".visible=false


func _on_fullscreen_button_pressed():
	# Verifica el estado actual de la ventana y alterna
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$fullscreen_button/Label.text = "MODO VENTANA"
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$fullscreen_button/Label.text = "PANTALLA COMPLETA"


func _on_volver_mouse_entered() -> void:
	$"BotónP".play()


func _on_fullscreen_button_mouse_entered() -> void:
	$"BotónP".play()
