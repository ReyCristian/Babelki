class_name Player extends CharacterBody2D

@export var speed = 200
@export var health = 10
#@onready var shoot: AudioStreamPlayer2D = $Player/Shoot

var en_burbuja = true;


func _physics_process(delta):
	if en_burbuja:
		nadar();
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
