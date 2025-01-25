extends Node2D

@export var player_scene: PackedScene = preload("res://player.tscn");
@export var derrota_scene: PackedScene = preload("res://derrota.tscn");
var pause_menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Instancio la escena del jugador
	var player :Player= player_scene.instantiate()
	# Posiciono al jugador (ajusta la posición)
	var screen_size = get_viewport_rect().size
	player.position = Vector2((screen_size.x ) / 2,  # Centro horizontal
		screen_size.y/2 ) 
	# Añadimos al jugador a la escena principal
	add_child(player)
	player.muerte.connect(derrota)
	pause_menu=preload("res://menu_pause.tscn").instantiate()
	add_child(pause_menu)
	pause_menu.visible=false

func derrota(tiempo):
	var burbuja_derrota :Derrota = derrota_scene.instantiate()
	burbuja_derrota.tiempo = tiempo;
	$"..".add_child(burbuja_derrota)

func pause_game():
	pause_menu.visible=true
	pause_menu.get_node("menu_pause").play()
	get_tree().paused = true  # Pausa el árbol de nodos


func unpause_game():
	pause_menu.visible=false
	pause_menu.get_node("menu_pause").stream_paused=true
	get_tree().paused = false  # Reanuda el juego
	
