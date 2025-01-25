class_name Derrota extends CanvasLayer

var tiempo :float = 3958;

func _ready() -> void:
	cargar_tiempo()
	
	
	
func cargar_tiempo():
	var seg = int(tiempo)
	var min = seg / 60;
	var hor = min / 60;
	seg %= 60;
	min %= 60;
	var label = $Tiempo;
	label.text = "";
	if (hor > 0):
		label.text += str("%02d" % hor) + " hs. "
	if (hor > 0 || min > 0):
		label.text += str("%02d" % min) + " min. "
	label.text += str("%02d" % seg) + " seg."


func _on_reiniciar() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
