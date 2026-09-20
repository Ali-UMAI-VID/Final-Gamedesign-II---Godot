extends Node2D
class_name nivel
@export var enemigo: EnemigoIA
@onready var collision_shape_2d = $CollisionShape2D
@onready var jugador = $Jugador

#puerta
@onready var animacion_puerta = $Animacion_puerta
@onready var animacion_puerta_2 = $Animacion_puerta2
@onready var animacion_puerta_3 = $Animacion_puerta3
var puerta = 0

func _physics_process(delta):
 #1 es izquierda, 2 es derecha, 3 arriba y 4 abajo
	#if puerta != 0:
	#	Globales.puede_moverse = false


	if puerta == 1:#izquierda
		if Input.is_action_just_pressed("Mov_puerta") and Globales.puede_moverse == true:
			Globales.puede_moverse = false
			animacion_puerta_2.play("Puerta")
			await animacion_puerta_2.animation_finished
			jugador.position.x -= 50
			puerta = 0
			Globales.puede_moverse = true


	if puerta == 2:#derecha
		if Input.is_action_just_pressed("Mov_puerta") and Globales.puede_moverse == true:
			Globales.puede_moverse = false
			animacion_puerta_2.play("Puerta")
			await animacion_puerta_2.animation_finished
			jugador.position.x += 50
			puerta = 0
			Globales.puede_moverse = true


	if puerta == 3:  #arriba
		if Input.is_action_just_pressed("Mov_puerta") and Globales.puede_moverse == true:
			print(jugador.position.y)
			Globales.puede_moverse = false
			animacion_puerta.play("Puerta")
			await animacion_puerta.animation_finished
			jugador.position.y -= 65
			puerta = 0
			print(jugador.position.y)
			Globales.puede_moverse = true


	if puerta == 4:#abajo
		if Input.is_action_just_pressed("Mov_puerta") and Globales.puede_moverse == true:
			Globales.puede_moverse = false
			animacion_puerta.play("Puerta")
			await animacion_puerta.animation_finished
			jugador.position.y += 65
			puerta = 0
			Globales.puede_moverse = true

func _on_area_puerta_arriba_body_entered(body):
	if body is Jugador:
		puerta = 3

func _on_area_puerta_abajo_body_entered(body):
	if body is Jugador:
		puerta = 4

func _on_area_puerta_izq_body_entered(body):
	if body is Jugador:
		puerta = 1


func _on_area_puerta_der_body_entered(body):
	if body is Jugador:
		puerta = 2

func _on_area_puerta_body_exited(body):
	if body is Jugador:
		puerta = 0
func _on_area_puerta_salida_body_entered(body):
	if body is Jugador:
		if Globales.tarjetas == 3:
			if Input.is_action_pressed("Mov_derecha"):
				print("pasa")
				animacion_puerta_3.play("Puerta")
				await animacion_puerta_3.animation_finished
				jugador.position = Vector2(1231.0, 408)


func _on_area_puerta_abajo_body_exited(body):
	pass # Replace with function body.
