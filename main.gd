extends Node2D

@export var player_scene: PackedScene = preload("res://player.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Instancio la escena del jugador
	var player = player_scene.instantiate()
	# Posiciono al jugador (ajusta la posición)
	var screen_size = get_viewport_rect().size
	player.position = Vector2((screen_size.x ) / 2,  # Centro horizontal
		screen_size.y/2 ) 
	# Añadimos al jugador a la escena principal
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
