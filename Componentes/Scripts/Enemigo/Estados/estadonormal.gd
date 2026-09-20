extends Estado
class_name EstadoNormal

@export var enemigo: EnemigoIA
@export var velocidad: int = 100
@export var gravedad: float = 100

func _physics_process(delta):
	#enemigo.velocity = Globales.direccion_enemigo * velocidad
	#enemigo.move_and_slide()
	pass
func _on_mirada_enemigo_area_entered(area):
	pass
	#if area is Jugador:
	#	Globales.direccion_enemigo = Globales.direccion_jugador
