extends Area2D

@export var speed = 200 # velocidad de la burbuja
var direction = Vector2.UP


func _physics_process(delta):
	position += direction * speed * delta
	if position.y < 0:
		queue_free()

#func _ready() -> void:
#	$"000207126Prev".play() acá cambio el audio por el que sea que lleve las burbujas cuando suban
