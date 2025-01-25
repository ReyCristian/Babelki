class_name Player extends CharacterBody2D

@export var speed = 333
@export var health = 10
#@onready var shoot: AudioStreamPlayer2D = $Player/Shoot

var tiempo :float = 0;

var en_burbuja = true;

signal muerte;

func _physics_process(delta):
	if en_burbuja:
		nadar();
		cargar_tiempo(delta);
	else:
		caer();
	handle_movement(delta);

func handle_movement(delta):
	# Normalizamos la velocidad y ajustamos según la speed
	velocity = velocity.normalized() * speed

	move_and_slide()
	
func burbuja_pop():
	en_burbuja = false;
	
func caer():
	velocity.y += 1

func nadar():	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		$CollisionShape2D.scale.x = 1
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		$CollisionShape2D.scale.x =-1
		velocity.x += 1

func cargar_tiempo(delta):
	tiempo += delta;
	var seg = int(tiempo)
	var min = seg / 60;
	var hor = min / 60;
	seg %= 60;
	min %= 60;
	var label = $CanvasLayer/VBoxContainer/Tiempo;
	label.text = "";
	if (hor > 0):
		label.text += str("%02d" % hor) + ":"
	if (hor > 0 || min > 0):
		label.text += str("%02d" % min) + ":"
	label.text += str("%02d" % seg);
	if (hor<=0 && min <=0):
		label.text += "s"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		$burbuja.pop()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if ! en_burbuja:
		muerte.emit(tiempo)
	pass # Replace with function body.
