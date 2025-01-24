extends Node2D

@export var player_scene: PackedScene  
@export var cofre_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Instancio la escena del jugador
	var player = player_scene.instantiate()
	# Posiciono al jugador (ajusta la posición)
	var screen_size = get_viewport_rect().size
	player.position = Vector2((screen_size.x ) / 2,  # Centro horizontal
		screen_size.y/2 ) 
	var cofre = cofre_scene.instantiate()
	cofre.position= Vector2 ((screen_size.x ) / 2,  # Centro horizontal
		screen_size.y)  # Parte inferior de la pantalla
	# Añadimos al jugador a la escena principal
	add_child(player)
	add_child(cofre)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
