extends Estado
class_name EstadoCaminar
@onready var animacion_jugador = $"../../AnimacionJugador"
@onready var jugador = $"../.."
@export var velocidad : float = 160
func entrada():
	maquina.jugador.movimiento_lateral_activado = true
func _physics_process(delta):
	var direccion: int = 0
	var escalera: int = 0
	if maquina.jugador.movimiento_lateral_activado == true:
		if Input.is_action_pressed("Mov_izquierda"):
			animacion_jugador.flip_h = true
			direccion = -1
			#Globales.direccion_jugador = Vector2.LEFT
		if Input.is_action_pressed("Mov_derecha"):
			animacion_jugador.flip_h = false
			direccion = 1
			#Globales.direccion_jugador = Vector2.RIGHT
		if Input.is_action_pressed("Mov_arriba"):
			escalera = -1
			#Globales.direccion_jugador = Vector2.UP
		if Input.is_action_pressed("Mov_abajo"):
			escalera = 1
			#Globales.direccion_jugador = Vector2.DOWN
		jugador.velocity.x = direccion * velocidad
		jugador.velocity.y = escalera * velocidad
		jugador.move_and_slide()

func _on_area_jugador_area_entered(area):
	if area.is_in_group("Carga_oxigeno"):
		maquina.transcicionar("Estado_Oxigeno")
