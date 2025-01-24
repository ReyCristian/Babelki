extends CharacterBody2D

#@export var speed = 100
#@export var bullet_scene = preload("res://burbuja.tscn")
@export var shoot_cooldown = 0.2
var shoot_interval = 1.0  # Intervalo en segundos entre disparos
var time_since_last_shot = 0.0

func _physics_process(delta):
	position.x 
