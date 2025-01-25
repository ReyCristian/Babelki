extends CanvasLayer

@export var cofre_scene: PackedScene = preload("res://cofre.tscn");
@export var timer_inicio= 3.14
@export var timer_fin= 3.14




func _on_timer_timeout() -> void:
	# Posiciono al jugador (ajusta la posición)
	var cofre = cofre_scene.instantiate();
	
	var pos = Vector2(
		randf_range($Marker2D.global_position.x,$Marker2D2.global_position.x),
		randf_range($Marker2D.global_position.y,$Marker2D2.global_position.y)
	)
	$"..".add_child(cofre);
	cofre.global_position = pos;
	modificar_timer()


func modificar_timer():
	$"Timer".wait_time=randf_range(timer_inicio,timer_fin)


func _ready():
	modificar_timer()
