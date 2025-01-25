extends ParallaxBackground

@export var velocidad_movimiento:int = 100;

func _process(delta: float) -> void:
	$ParallaxLayer.motion_offset.x += -delta * velocidad_movimiento; 
	pass
