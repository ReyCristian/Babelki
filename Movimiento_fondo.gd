extends ParallaxBackground

@export var velocidad_movimiento:int = 166;

func _process(delta: float) -> void:
	$Arena.motion_offset.x += -delta * velocidad_movimiento; 
	$Montaña2.motion_offset.x += -delta * velocidad_movimiento/2; 
	$"Montaña".motion_offset.x += -delta * velocidad_movimiento/3; 
	$Peces.motion_offset.x += -delta * velocidad_movimiento/1.5;
	$Peces2.motion_offset.x += delta * velocidad_movimiento/2; 
	$"../Agua".position.x += -delta * velocidad_movimiento
	pass
