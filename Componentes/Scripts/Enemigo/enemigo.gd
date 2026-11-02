extends CharacterBody2D
class_name EnemigoIA

@onready var navigation_agent_2d = $NavigationAgent2D
@export var mirada : Area2D
@export var waypoints: Array[Marker2D]
@export var speed: float
@export var Cercania_sonido : AudioStreamPlayer2D

var veloPerseguir: int = 150
@export var player: Jugador
@export var perseguir_timer: Timer

var current_index : int = 0 # numero de waypoint que esta el jugador
var is_waiting : bool = false #espera entre waypoints
#var direccion : Vector2 = Vector2.ZERO
var estado : String = "vigilando"

@onready var punto_enemigo_2 = $"../Punto_enemigo2"
@onready var punto_enemigo_1 = $"../Punto_enemigo1"
@onready var punto_enemigo_3 = $"../Punto_enemigo3"
@onready var punto_enemigo_4 = $"../Punto_enemigo4"
@onready var punto_enemigo_5 = $"../Punto_enemigo5"
@onready var punto_enemigo_6 = $"../Punto_enemigo6"
@onready var punto_enemigo_7 = $"../Punto_enemigo7"




func _ready():
	Globales.ene_sigue_a = 1
	
func _physics_process(delta):
	
	if estado == "vigilando":
		_ene_vigilando()
	elif estado == "persiguiendo":
		_ene_persiguiendo()
	elif estado == "muerto":
		_ene_muerto()
	move_and_slide()

#timer out	is_waiting = false

var ultimo_punto: int = 0

func _ene_vigilando():
	
	if Globales.ene_sigue_a != ultimo_punto:
		ultimo_punto = Globales.ene_sigue_a

		match ultimo_punto:
			1:
				if is_instance_valid(punto_enemigo_1):
					navigation_agent_2d.target_position = punto_enemigo_1.global_position
			2:
				if is_instance_valid(punto_enemigo_2):
					navigation_agent_2d.target_position = punto_enemigo_2.global_position
			3:
				if is_instance_valid(punto_enemigo_3):
					navigation_agent_2d.target_position = punto_enemigo_3.global_position
			4:
				if is_instance_valid(punto_enemigo_4):
					navigation_agent_2d.target_position = punto_enemigo_4.global_position
			5:
				if is_instance_valid(punto_enemigo_5):
					navigation_agent_2d.target_position = punto_enemigo_5.global_position
			6:
				if is_instance_valid(punto_enemigo_6):
					navigation_agent_2d.target_position = punto_enemigo_6.global_position
			7:
				if is_instance_valid(punto_enemigo_7):
					navigation_agent_2d.target_position = punto_enemigo_7.global_position

	var direction = to_local(
		navigation_agent_2d.get_next_path_position()
	).normalized()

	velocity = direction * veloPerseguir
	
	
	#if is_waiting:
	#	return
	
	#var min_distance = 5.0
	#var target_position = waypoints[current_index].global_position
	#var direction = global_position.direction_to(target_position)
	#var distance = global_position.distance_to(target_position)
	
	#velocity = direction * speed
	#if distance < min_distance:
	#	current_index += 1
	#	velocity = Vector2.ZERO
	#	$Timerquieto.start()
	#	is_waiting = true
	#	if current_index >= waypoints.size():
	#		current_index = 0
	#move_and_slide()
	
func _ene_persiguiendo():
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = direction * veloPerseguir

func _ene_muerto():
	pass

func _on_timerquieto_timeout():
	is_waiting = false


#func _on_mirada_enemigo_area_entered(area):
#	if area is Jugador:
#		persiguiendo = true
#		perseguir_timer.start()
#		print("toca a jugador")


func _on_timer_perseguir_timer_timeout():
	estado = "vigilando"


func _on_timer_rastreo_timeout():
	if estado == "persiguiendo":
		navigation_agent_2d.target_position = player.global_position
		velocity = position.direction_to(navigation_agent_2d.get_next_path_position())


func _on_mirada_enemigo_body_entered(body):
	if body is Jugador:
		estado = "persiguiendo"
		perseguir_timer.start()
		#print("toca a jugador")


func _on_area_ruido_ene_body_entered(body):
	if body is Jugador:
		Cercania_sonido.play()
	

func _on_area_ruido_ene_body_exited(body):
	if body is Jugador:
		Cercania_sonido.stop()


func _on_ataque_area_body_entered(body):
	if body is Jugador:
		Globales.vidas -= 1
		#print(Globales.vidas)
