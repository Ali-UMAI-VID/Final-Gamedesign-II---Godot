extends CharacterBody2D
class_name EnemigoIA

@onready var navigation_agent_2d = $NavigationAgent2D
@onready var maquina : MaquinaEstado = get_node("MaquinaEstado")
@export var mirada : Area2D
@export var waypoints: Array[Marker2D]
@export var speed: float
@export var Cercania_sonido : AudioStreamPlayer2D

var veloPerseguir: int = 150
@export var player: Jugador
@export var perseguir: Timer

var current_index = 0
var is_waiting = false
#var direccion : Vector2 = Vector2.ZERO

func _ready():
	#player = get_tree().get_first_node_in_group("player")
	pass
	
func _physics_process(delta):
	if Globales.enemigo_a_jugador == false:
		_ene_vigila()
	else:
		var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
		velocity = direction * veloPerseguir
	move_and_slide()

#timer out	is_waiting = false

func _ene_vigila():
	
	if is_waiting:
		return
#	maquina.estado.proceso(delta)
	var min_distance = 5.0
	var target_position = waypoints[current_index].global_position
	var direction = target_position - global_position
	var distance = direction.length()
	
	direction = direction.normalized()
	velocity = direction * speed
	if distance < min_distance:
		current_index += 1
		velocity = Vector2.ZERO
		$Timerquieto.start()
		is_waiting = true
		if current_index >= waypoints.size():
			current_index = 0
	move_and_slide()
	
func _ene_a_jugador():
	pass

func _on_timerquieto_timeout():
	is_waiting = false


#func _on_mirada_enemigo_area_entered(area):
#	if area is Jugador:
#		Globales.enemigo_a_jugador = true
#		perseguir.start()
#		print("toca a jugador")


func _on_timer_perseguir_timeout():
	Globales.enemigo_a_jugador = false


func _on_timer_rastreo_timeout():
	navigation_agent_2d.target_position = player.global_position
	velocity = position.direction_to(navigation_agent_2d.get_next_path_position())


func _on_mirada_enemigo_body_entered(body):
	if body is Jugador:
		Globales.enemigo_a_jugador = true
		perseguir.start()
		print("toca a jugador")


func _on_area_ruido_ene_body_entered(body):
	if body is Jugador:
		Cercania_sonido.play()
	

func _on_area_ruido_ene_body_exited(body):
	if body is Jugador:
		Cercania_sonido.stop()
