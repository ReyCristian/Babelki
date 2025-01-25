class_name Burbuja extends Area2D

@export var speed = 200 # velocidad de la burbuja
var direction = Vector2.UP

@export var cantidad_aire = +0.02;

func _ready() -> void:
	color_bubbles()
	tamaño_burbuja()
	flotar()



func _physics_process(delta):
	position += direction * speed * delta
	if position.y < 0:
		queue_free()

#func _ready() -> void:
#	$"000207126Prev".play() acá cambio el audio por el que sea que lleve las burbujas cuando suban
func color_bubbles():
	if cantidad_aire<0:
		modulate = Color("c10011")
		
func tamaño_burbuja():
	var escala = (abs(cantidad_aire)+0.01) / 0.04
	scale = Vector2(escala,escala)
	

func flotar():
	#var random_start = randi_range(0, $AnimationPlayer.current_animation_length)
	#$AnimationPlayer.seek(random_start, true)
	$AnimationPlayer.play("flotar")




func pop() -> float:
	queue_free();
	return cantidad_aire;
