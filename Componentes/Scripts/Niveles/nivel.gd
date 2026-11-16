extends Node2D
class_name nivel
@export var enemigo: EnemigoIA
@onready var collision_shape_2d = $CollisionShape2D
@onready var jugador = $Jugador
var timer_oxigeno: float = 3
@onready var oxigeno = $Jugador/Interfaz/Oxigeno

#puerta

var area_salida = false

@onready var punto_enemigo_1 = $Punto_enemigo1
@onready var punto_enemigo_2 = $Punto_enemigo2
@onready var punto_enemigo_3 = $Punto_enemigo3
@onready var punto_enemigo_4 = $Punto_enemigo4
@onready var punto_enemigo_5 = $Punto_enemigo5
@onready var punto_enemigo_6 = $Punto_enemigo6
@onready var punto_enemigo_7 = $Punto_enemigo7



@onready var audio_motor = $AreaRuidoMotor/AudioMotor



func _process(delta):
	if area_salida == true:
		pass
		#if Input.is_action_pressed("Accion"):
			#print("pasa")
			#animacion_puerta_3.play("Puerta")
			#await animacion_puerta_3.animation_finished
			#jugador.position = Vector2(1291.0, 404)

	$Jugador/Interfaz.barra_oxigeno.value = Globales.oxigeno
	$Jugador/Interfaz.barra_vida.value = Globales.vidas * 33.33

func _physics_process(delta):

	var punto_actual: Area2D

	match Globales.ene_sigue_a:
		1:
			punto_actual = punto_enemigo_1
		2:
			punto_actual = punto_enemigo_2
		3:
			punto_actual = punto_enemigo_3
		4:
			punto_actual = punto_enemigo_4
		5:
			punto_actual = punto_enemigo_5
		6:
			punto_actual = punto_enemigo_6
		7:
			punto_actual = punto_enemigo_7

	if enemigo.global_position.distance_to(punto_actual.global_position) < 10:
		Globales.ene_sigue_a += 1

	if Globales.ene_sigue_a > 7: ##valor cambia dependiendo de la cantidad de puntos_enemigo
		Globales.ene_sigue_a = 1
	
	
	if Globales.vidas <= 0:
		get_tree().quit()
	if Globales.oxigeno <= 0:
		get_tree().quit()
	oxigeno.text = str(int(Globales.oxigeno)) + "%"
 #1 es izquierda, 2 es derecha, 3 arriba y 4 abajo
	#if puerta != 0:
	#	Globales.puede_moverse = false







	#if puerta == 3:  #arriba
		#if Input.is_action_just_pressed("Accion") and Globales.puede_moverse == true:
			#print(jugador.position.y)
			#Globales.puede_moverse = false
			#animacion_puerta.play("Puerta")
			#await animacion_puerta.animation_finished
			#jugador.position.y -= 50
			#puerta = 0
			#print(jugador.position.y)
			#Globales.puede_moverse = true



func _on_area_puerta_salida_body_entered(body):
	if body is Jugador:
		if Globales.tarjetas == 3:
			area_salida = true

func _on_area_puerta_salida_area_exited(area):
	if area is Jugador:
		if Globales.tarjetas == 3:
			area_salida = false


#func _on_area_ruido_motor_body_entered(body):
	#if body is Jugador:
		#audio_motor.play()
