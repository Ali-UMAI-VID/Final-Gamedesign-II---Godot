extends Node2D
class_name nivel
@export var enemigo: EnemigoIA
@onready var collision_shape_2d = $CollisionShape2D
@onready var jugador = $Jugador
var timer_oxigeno: float = 3
@onready var oxigeno = $Jugador/Interfaz/Oxigeno


#puerta
@onready var animacion_puerta = $Animacion_puerta
@onready var animacion_puerta_2 = $Animacion_puerta2
@onready var animacion_puerta_3 = $Animacion_puerta3
var puerta = 0
var area_salida = false
func _process(delta):

	if area_salida == true:
		if Input.is_action_pressed("Accion"):
			print("pasa")
			animacion_puerta_3.play("Puerta")
			await animacion_puerta_3.animation_finished
			jugador.position = Vector2(1291.0, 404)
	$Jugador/Interfaz.barra_oxigeno.value = Globales.oxigeno
	
	$Jugador/Interfaz.barra_vida.value = Globales.vidas * 33.33
func _physics_process(delta):
	if Globales.vidas <= 0:
		get_tree().quit()
	if Globales.oxigeno <= 0:
		get_tree().quit()
	oxigeno.text = str(int(Globales.oxigeno))
 #1 es izquierda, 2 es derecha, 3 arriba y 4 abajo
	#if puerta != 0:
	#	Globales.puede_moverse = false

	if puerta == 1:#izquierda
		if Input.is_action_just_pressed("Accion") and Globales.puede_moverse == true:
			Globales.puede_moverse = false
			animacion_puerta_2.play("Puerta")
			await animacion_puerta_2.animation_finished
			jugador.position.x -= 100
			puerta = 0
			Globales.puede_moverse = true


	if puerta == 2:#derecha
		if Input.is_action_just_pressed("Accion") and Globales.puede_moverse == true:
			Globales.puede_moverse = false
			animacion_puerta_2.play("Puerta")
			await animacion_puerta_2.animation_finished
			jugador.position.x += 100
			puerta = 0
			Globales.puede_moverse = true


	if puerta == 3:  #arriba
		if Input.is_action_just_pressed("Accion") and Globales.puede_moverse == true:
			print(jugador.position.y)
			Globales.puede_moverse = false
			animacion_puerta.play("Puerta")
			await animacion_puerta.animation_finished
			jugador.position.y -= 50
			puerta = 0
			print(jugador.position.y)
			Globales.puede_moverse = true


	if puerta == 4:#abajo
		if Input.is_action_just_pressed("Accion") and Globales.puede_moverse == true:
			Globales.puede_moverse = false
			animacion_puerta.play("Puerta")
			await animacion_puerta.animation_finished
			jugador.position.y += 50
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
			area_salida = true
