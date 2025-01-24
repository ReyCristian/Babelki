extends CharacterBody2D

@export var speed = 200
@export var health = 10
#@onready var shoot: AudioStreamPlayer2D = $Player/Shoot



func _physics_process(delta):
	handle_movement(delta)

func handle_movement(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.scale.x=0.20
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		$Sprite2D.scale.x =-0.20
		velocity.x += 1

	# Normalizamos la velocidad y ajustamos según la speed
	velocity = velocity.normalized() * speed

	# Asignamos la velocidad al CharacterBody2D
	self.velocity = velocity
	move_and_slide()
