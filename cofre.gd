extends CharacterBody2D

#@export var speed = 100
@export var bubbles_scene = preload("res://burbuja_inicial.tscn")
@export var shoot_cooldown = 0.2
var shoot_interval = 1.0  # Intervalo en segundos entre disparos
var time_since_last_shot = 0.0
var shoot_timer = 0.5


#func _physics_process(delta):
#	position.x 

func shoot_bubbles():
	# Instancia la bala
	var bubbles = bubbles_scene.instantiate()
	bubbles.position = position # la pos del player
	bubbles.direction = Vector2.UP # va pa arriba
	get_parent().add_child(bubbles) # aparece la bala
