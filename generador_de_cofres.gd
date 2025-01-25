extends CanvasLayer

@export var cofre_scene: PackedScene = preload("res://cofre.tscn");


func _on_timer_timeout() -> void:
	# Posiciono al jugador (ajusta la posición)
	var screen_size = $"..".get_viewport_rect().size;
	var cofre = cofre_scene.instantiate();
	var colocador_original = $Colocador_Cofre;
	var nuevo_colocador = colocador_original.instance()
	
	add_child(nuevo_colocador)
	nuevo_colocador.add_child(cofre);
	var pos = nuevo_colocador.global_position;
	
	remove_child(nuevo_colocador);
	$"..".add_child(nuevo_colocador);
	cofre.global_position = pos;
