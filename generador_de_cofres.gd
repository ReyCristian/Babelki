extends CanvasLayer

@export var cofre_scene: PackedScene = preload("res://cofre.tscn");


func _on_timer_timeout() -> void:
	# Posiciono al jugador (ajusta la posición)
	var screen_size = $"..".get_viewport_rect().size;
	var cofre = cofre_scene.instantiate();
	
	var pos = Vector2(
		randf_range($Marker2D.global_position.x,$Marker2D2.global_position.x),
		randf_range($Marker2D.global_position.y,$Marker2D2.global_position.y)
	)

	$"..".add_child(cofre);
	cofre.global_position = pos;
