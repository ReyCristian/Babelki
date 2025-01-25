extends VBoxContainer

func _on_continuar_pressed() -> void:
	get_tree().paused = false  # Reanuda el juego
	get_parent().visible=false

func _on_opciones_pressed() -> void:
	$"../Menu_Opcion".visible=true
	self.visible=false
