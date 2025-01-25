extends Area2D

@export var velocidad_perdida = 0.05; 
@export var tamaño_minimo: int;
@export var player:Player;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var perdida = delta * velocidad_perdida;
	agregar_aire(-perdida)
	revisar_tamaño();
	pass
	

func revisar_tamaño():
	if (obtener_tamaño() < tamaño_minimo):
		player.burbuja_pop();
		queue_free()
	pass
	
func obtener_tamaño():
	return 2 * $CollisionShape2D.shape.radius * min(scale.x,scale.y)
	
func agregar_aire(incremento):
	scale += Vector2(incremento,incremento); 

func _on_area_entered(area: Area2D) -> void:
	if (area is Burbuja):
		agregar_aire(area.pop());
	pass # Replace with function body.
