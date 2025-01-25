extends Area2D

@export var velocidad_perdida = 0.15; 
@export var player:Player;

var oxigeno = 1.0;
@onready var escala_inicial = min(scale.x, scale.y);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	calcular_oxigeno();
	var perdida = delta * velocidad_perdida * oxigeno;
	agregar_aire(-perdida)
	revisar_tamaño();
	pass
	

func revisar_tamaño():
	if (obtener_tamaño() < 1):
		pop()
	pass
	
func obtener_tamaño():
	return min(scale.x, scale.y)
	
func agregar_aire(incremento):
	scale += Vector2(incremento,incremento); 

func _on_area_entered(area: Area2D) -> void:
	if (area is Burbuja):
		agregar_aire(area.pop());
	pass # Replace with function body.

func calcular_oxigeno():
	oxigeno = (min(scale.x, scale.y) - 0.99)/(escala_inicial - 0.99)
	if oxigeno < 0:
		oxigeno = 0;
	$"../CanvasLayer/VBoxContainer/oxigeno".text = str("%d%%" % int(oxigeno * 100))

func pop():
		player.burbuja_pop();
		queue_free()
