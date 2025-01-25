extends VBoxContainer

@onready var music_volume_slider = $LabelMusic/music
@onready var master_volume_slider = $LabelMaster/master
@onready var efect_volumen_slider=$LabelEfect/Efect


func _ready():
	## Inicializar sliders con el volumen actual de los buses de audio
	var sonido_master= AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	var slider_master=lerp(0,100,(sonido_master+80)/80)
	$LabelMaster/master.value= slider_master
  
	var sonido_musica= AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Musica"))
	var slider_musica=lerp(0,100,(sonido_musica+80)/80)
	$LabelMusic/music.value=slider_musica
	var sonido_efecto= AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Efecto"))
	var slider_efecto=lerp(0,100,(sonido_efecto+80)/80)
	$LabelEfect/Efect.value=slider_efecto
	#if get_tree().current_scene.name=="Menu_Opciones":
	#	$menu.play() Esto reproduce la musica
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		$fullscreen_button.text = "Modo Ventana"
	else:
		$fullscreen_button.text = "Pantalla Completa"
	


func _on_master_value_changed(value: float) -> void:
	var db_value = lerp(-80, 0, value/100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_value)

func _on_music_value_changed(value: float) -> void:
	var db_value = lerp(-80,0,value/100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"),db_value)

func _on_efect_value_changed(value: float) -> void:
	var db_value =lerp(-80,0,value/100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Efecto"),db_value)

func _on_volver_pressed() -> void:
	print(get_tree().current_scene)
	if get_tree().current_scene.name=="Menu_Opcion":
		get_tree().change_scene_to_file("res://main_menu.tscn")#vuelve al main
	else:
		get_tree().get_first_node_in_group("menu_pause").visible=true
		$"..".visible=false


func _on_fullscreen_button_pressed():
	# Verifica el estado actual de la ventana y alterna
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$fullscreen_button.text = "Modo Ventana"
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$fullscreen_button.text = "Pantalla Completa"


func _on_volver_mouse_entered() -> void:
	$"BotónP".play()


func _on_fullscreen_button_mouse_entered() -> void:
	$"BotónP".play()
