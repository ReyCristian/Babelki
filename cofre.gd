extends CharacterBody2D

@export var speed = 100
@export var bubbles_scene = preload("res://burbuja_inicial.tscn")
@export var shoot_cooldown = 0.4
@export var shoot_duration = 2.0  # Duración total del disparo
var shoot_interval = 1.0  # Intervalo en segundos entre disparos
var time_since_last_shot = 0.20
var shoot_timer = 0.5
var cantidad
var is_shooting = false  # Controla si el cofre está disparando

func _ready():
	# Configurar los Timers
	$shoot_timer.wait_time = shoot_cooldown
	$shoot_timer.one_shot = false  # Repetir disparos
	$shoot_duration_timer.wait_time = shoot_duration
	$shoot_duration_timer.one_shot = true  # Solo una vez
	wait_shooting()

func start_shooting():
	if not is_shooting:
		is_shooting = true
		$shoot_timer.start()  # Comienza a disparar burbujas
		$shoot_duration_timer.start()  # Comienza la cuenta regresiva del tiempo de disparo
		cantidad=randf_range(-0.03,0.03)
		$Burbuja.play()

func abrir_cofre():
	$AnimationPlayer.play("abrir")
	$AperturaCofre.play()#acá se reproduce el abrir el cofre

func wait_shooting():
	$shoot_wait.wait_time=randf_range(2.0,10.0)
	$shoot_wait.one_shot=true
	$shoot_wait.start()



func _physics_process(delta):
	position.x 


func shoot_bubbles():
	# Instancia la bala
	var bubbles: Burbuja = bubbles_scene.instantiate()
	bubbles.position = position # la pos del player
	bubbles.direction = Vector2.UP # va pa arriba
	bubbles.cantidad_aire= cantidad
	get_parent().add_child(bubbles) # Añadir la burbuja como hijo





func _on_shoot_duration_timeout():
	# Finalizar el disparo
	is_shooting = false
	$shoot_timer.stop()  # Detener el Timer que dispara burbujas
	wait_shooting()
	$AnimationPlayer.play("cerrar")
	$CierreCofre.play()




func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	$Burbuja.stop()
