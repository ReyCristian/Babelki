class_name Creditos extends CanvasLayer

signal termina

func _ready() -> void:
	$AnimationPlayer.play("iniciar")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	termina.emit()
