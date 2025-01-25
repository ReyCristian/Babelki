extends CharacterBody2D

@export var speed = 150


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func explode():
	queue_free()
