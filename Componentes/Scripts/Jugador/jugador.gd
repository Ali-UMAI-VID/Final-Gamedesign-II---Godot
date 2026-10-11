extends CharacterBody2D
class_name  Jugador

@export var velocidad : float = 160
var movimiento_lateral_activado : bool = true
@export var sprite : AnimatedSprite2D

func _physics_process(delta):
	var direccion: int = 0
	var escalera: int = 0
	if Input.is_action_pressed("Mov_izquierda") and Globales.puede_moverse == true:
		sprite.flip_h = true
		direccion = -1
		#Globales.direccion_jugador = Vector2.LEFT
	if Input.is_action_pressed("Mov_derecha") and Globales.puede_moverse == true:
		sprite.flip_h = false
		direccion = 1
		#Globales.direccion_jugador = Vector2.RIGHT
	if Input.is_action_pressed("Mov_arriba") and Globales.puede_moverse == true:
		escalera = -1
		#Globales.direccion_jugador = Vector2.UP
	if Input.is_action_pressed("Mov_abajo") and Globales.puede_moverse == true:
		escalera = 1
		#Globales.direccion_jugador = Vector2.DOWN
	velocity.x = direccion * velocidad
	velocity.y = escalera * velocidad
	move_and_slide()
		
